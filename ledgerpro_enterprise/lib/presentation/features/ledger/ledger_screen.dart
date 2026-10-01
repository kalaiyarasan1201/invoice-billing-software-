import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../application/providers/database_provider.dart';
import '../../../infrastructure/database/database.dart';


class LedgerEntry {
  final DateTime date;
  final String description;
  final double debit;
  final double credit;
  double balance;

  LedgerEntry({
    required this.date,
    required this.description,
    this.debit = 0.0,
    this.credit = 0.0,
    this.balance = 0.0,
  });
}

final customerLedgerProvider = FutureProvider.autoDispose.family<List<LedgerEntry>, int>((ref, customerId) async {
  final db = ref.watch(databaseProvider);
  final customer = await (db.select(db.customers)..where((t) => t.id.equals(customerId))).getSingle();
  final invoices = await (db.select(db.invoices)..where((t) => t.customerId.equals(customerId))).get();
  final payments = await (db.select(db.payments)..where((t) => t.customerId.equals(customerId))).get();

  List<LedgerEntry> entries = [];

  // Opening Balance Entry (Assuming debit balance if positive)
  if (customer.openingBalance != 0) {
    entries.add(LedgerEntry(
      date: customer.createdAt, // Or a fixed 'opening' date
      description: 'Opening Balance',
      debit: customer.openingBalance > 0 ? customer.openingBalance : 0,
      credit: customer.openingBalance < 0 ? customer.openingBalance.abs() : 0,
    ));
  }

  // Invoice Entries (Debits) and Immediate Invoice Payments (Credits)
  for (var inv in invoices) {
    entries.add(LedgerEntry(
      date: inv.invoiceDate,
      description: 'Invoice #${inv.invoiceNumber}',
      debit: inv.grandTotal,
    ));

    if (inv.amountReceived > 0) {
      entries.add(LedgerEntry(
        date: inv.invoiceDate,
        description: 'Payment against #${inv.invoiceNumber} (${inv.paymentMethod ?? "Cash"})',
        credit: inv.amountReceived,
      ));
    }
  }

  // Standalone Payments (Credits)
  for (var p in payments) {
    entries.add(LedgerEntry(
      date: p.paymentDate,
      description: 'Payment (${p.paymentMode}) ${p.referenceNumber != null && p.referenceNumber!.isNotEmpty ? "- Ref: ${p.referenceNumber}" : ""}',
      credit: p.amount,
    ));
  }

  // Sort chronologically
  entries.sort((a, b) => a.date.compareTo(b.date));

  // Calculate Running Balance
  double runningBalance = 0.0;
  for (var entry in entries) {
    runningBalance += entry.debit;
    runningBalance -= entry.credit;
    entry.balance = runningBalance;
  }

  return entries;
});

class LedgerScreen extends ConsumerStatefulWidget {
  const LedgerScreen({super.key});

  @override
  ConsumerState<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends ConsumerState<LedgerScreen> {
  Customer? _selectedCustomer;

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final customers = customersAsync.value ?? [];

    return Container(
      color: const Color(0xFFF4F6F8),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E3A8A).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.menu_book, color: Color(0xFF1E3A8A)),
              ),
              const SizedBox(width: 12),
              const Text('Customer Ledger', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
              
              const Spacer(),
              
              // Customer Selection
              SizedBox(
                width: 300,
                child: Autocomplete<Customer>(
                  displayStringForOption: (Customer option) => option.tradeName,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) return const Iterable<Customer>.empty();
                    return customers.where((Customer option) {
                      return option.tradeName.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (Customer selection) {
                    setState(() {
                      _selectedCustomer = selection;
                    });
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    if (_selectedCustomer != null && textEditingController.text != _selectedCustomer!.tradeName) {
                      textEditingController.text = _selectedCustomer!.tradeName;
                    }
                    return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: 'Search customer...',
                        prefixIcon: const Icon(Icons.search, color: Colors.blue),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Ledger Table
          Expanded(
            child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF0F172A),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                          child: const Row(
                            children: [
                              Expanded(flex: 2, child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14))),
                              Expanded(flex: 5, child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14))),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('Debit (₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 16.0), child: Text('Credit (₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 2, child: Text('Balance (₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right)),
                            ],
                          ),
                        ),
                        
                        // Table Body
                        Expanded(
                          child: _selectedCustomer == null 
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_search, size: 64, color: Colors.grey.shade300),
                                    const SizedBox(height: 16),
                                    Text('Select a customer to view their ledger', style: TextStyle(color: Colors.grey.shade500, fontSize: 16)),
                                  ],
                                ),
                              )
                            : ref.watch(customerLedgerProvider(_selectedCustomer!.id)).when(
                            data: (entries) {
                              if (entries.isEmpty) {
                                return const Center(child: Text('No transactions found for this customer.'));
                              }
                              
                              return ListView.separated(
                                itemCount: entries.length,
                                separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
                                itemBuilder: (context, index) {
                                  final entry = entries[index];
                                  final isDebit = entry.debit > 0;
                                  final isCredit = entry.credit > 0;
                                  
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 2, child: Text(DateFormat('dd-MM-yyyy').format(entry.date), style: const TextStyle(color: Colors.black87))),
                                        Expanded(flex: 5, child: Text(entry.description, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF1E3A8A)))),
                                        Expanded(
                                          flex: 2, 
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Text(isDebit ? entry.debit.toStringAsFixed(2) : '—', textAlign: TextAlign.right, style: TextStyle(color: isDebit ? Colors.redAccent : Colors.black54)),
                                          )
                                        ),
                                        Expanded(
                                          flex: 2, 
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 16.0),
                                            child: Text(isCredit ? entry.credit.toStringAsFixed(2) : '—', textAlign: TextAlign.right, style: TextStyle(color: isCredit ? Colors.green : Colors.black54, fontWeight: isCredit ? FontWeight.bold : FontWeight.normal)),
                                          )
                                        ),
                                        Expanded(
                                          flex: 2, 
                                          child: Text(entry.balance.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (e, s) => Center(child: Text('Error: $e')),
                          ),
                        ),
                        
                        // Footer Totals
                        Consumer(
                          builder: (context, ref, child) {
                            if (_selectedCustomer == null) return const SizedBox.shrink();
                            final ledgerAsync = ref.watch(customerLedgerProvider(_selectedCustomer!.id));
                            if (!ledgerAsync.hasValue || ledgerAsync.value!.isEmpty) return const SizedBox.shrink();
                            
                            final entries = ledgerAsync.value!;
                            final totalDebit = entries.fold(0.0, (sum, e) => sum + e.debit);
                            final totalCredit = entries.fold(0.0, (sum, e) => sum + e.credit);
                            final finalBalance = entries.last.balance;
                            
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8FAFC),
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
                                border: Border(top: BorderSide(color: Colors.grey.shade300)),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                              child: Row(
                                children: [
                                  const Expanded(flex: 7, child: Text('CLOSING BALANCE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.black54), textAlign: TextAlign.right)),
                                  Expanded(
                                    flex: 2, 
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Text(totalDebit.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                                    )
                                  ),
                                  Expanded(
                                    flex: 2, 
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Text(totalCredit.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                                    )
                                  ),
                                  Expanded(
                                    flex: 2, 
                                    child: Text('₹ ${finalBalance.toStringAsFixed(2)}', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: finalBalance > 0 ? Colors.redAccent : Colors.green)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
