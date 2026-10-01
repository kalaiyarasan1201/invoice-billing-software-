import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../../../application/providers/database_provider.dart';
import '../../../infrastructure/database/database.dart';

// We define a provider for the selected customer's outstanding balance
final customerOutstandingProvider = FutureProvider.family<double, int>((
  ref,
  customerId,
) async {
  final db = ref.watch(databaseProvider);
  final customer = await (db.select(
    db.customers,
  )..where((t) => t.id.equals(customerId))).getSingle();
  final invoices = await (db.select(
    db.invoices,
  )..where((t) => t.customerId.equals(customerId))).get();
  final payments = await (db.select(
    db.payments,
  )..where((t) => t.customerId.equals(customerId))).get();

  double totalSales = invoices.fold(0.0, (sum, inv) => sum + inv.grandTotal);
  double totalInvoicesPaid = invoices.fold(
    0.0,
    (sum, inv) => sum + inv.amountReceived,
  );
  double totalStandalonePayments = payments.fold(
    0.0,
    (sum, p) => sum + p.amount,
  );

  return customer.openingBalance +
      totalSales -
      totalInvoicesPaid -
      totalStandalonePayments;
});

final recentPaymentsProvider = StreamProvider<List<Payment>>((ref) {
  final db = ref.watch(databaseProvider);
  return (db.select(
    db.payments,
  )..orderBy([(t) => drift.OrderingTerm.desc(t.paymentDate)])).watch();
});

class PaymentsScreen extends ConsumerStatefulWidget {
  const PaymentsScreen({super.key});

  @override
  ConsumerState<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends ConsumerState<PaymentsScreen> {
  final _amountController = TextEditingController();
  final _remarksController = TextEditingController();
  final _refNumberController = TextEditingController();
  String _paymentMode = 'Cash';
  DateTime _paymentDate = DateTime.now();
  Customer? _selectedCustomer;

  @override
  void dispose() {
    _amountController.dispose();
    _remarksController.dispose();
    _refNumberController.dispose();
    super.dispose();
  }

  void _recordPayment(Customer customer, double outstanding) async {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    final db = ref.read(databaseProvider);
    await db
        .into(db.payments)
        .insert(
          PaymentsCompanion.insert(
            customerId: customer.id,
            amount: amount,
            paymentMode: drift.Value(_paymentMode),
            paymentDate: drift.Value(_paymentDate),
            referenceNumber: drift.Value(_refNumberController.text),
            remarks: drift.Value(_remarksController.text),
          ),
        );

    // Refresh everything
    _amountController.clear();
    _remarksController.clear();
    _refNumberController.clear();
    ref.invalidate(customerOutstandingProvider(customer.id));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment recorded successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final customers = customersAsync.value ?? [];
    final recentPaymentsAsync = ref.watch(recentPaymentsProvider);

    return Container(
      color: const Color(0xFFF4F6F8),
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT PANEL: Payment Entry Form
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment & Credit Entry',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Record payments received against outstanding credit.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Divider(height: 48),

                    const Text(
                      'Select Customer',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Autocomplete<Customer>(
                      displayStringForOption: (Customer option) =>
                          option.tradeName,
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty)
                          return const Iterable<Customer>.empty();
                        return customers.where((Customer option) {
                          return option.tradeName.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          );
                        });
                      },
                      onSelected: (Customer selection) {
                        setState(() {
                          _selectedCustomer = selection;
                        });
                      },
                      fieldViewBuilder:
                          (
                            context,
                            textEditingController,
                            focusNode,
                            onFieldSubmitted,
                          ) {
                            if (_selectedCustomer != null &&
                                textEditingController.text !=
                                    _selectedCustomer!.tradeName) {
                              textEditingController.text =
                                  _selectedCustomer!.tradeName;
                            }
                            return TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                hintText: 'Type to search customer...',
                                prefixIcon: const Icon(
                                  Icons.person_search,
                                  color: Colors.blue,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade50,
                              ),
                            );
                          },
                    ),

                    if (_selectedCustomer != null) ...[
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade100),
                        ),
                        child: ref
                            .watch(
                              customerOutstandingProvider(
                                _selectedCustomer!.id,
                              ),
                            )
                            .when(
                              data: (outstanding) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Total Outstanding Balance',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _selectedCustomer!.tradeName,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '₹ ${outstanding.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: outstanding > 0
                                          ? Colors.redAccent
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              error: (e, s) => Text('Error: $e'),
                            ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Payment Mode',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: _paymentMode,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items:
                                      ['Cash', 'UPI', 'Bank Transfer', 'Cheque']
                                          .map(
                                            (mode) => DropdownMenuItem(
                                              value: mode,
                                              child: Text(mode),
                                            ),
                                          )
                                          .toList(),
                                  onChanged: (val) =>
                                      setState(() => _paymentMode = val!),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Amount Received (₹)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _amountController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.currency_rupee,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _refNumberController,
                              decoration: InputDecoration(
                                labelText:
                                    'Reference Number (e.g., UTR/Cheque No)',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: _paymentDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (date != null)
                                  setState(() => _paymentDate = date);
                              },
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Payment Date',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  DateFormat(
                                    'dd MMM yyyy',
                                  ).format(_paymentDate),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _remarksController,
                        decoration: InputDecoration(
                          labelText: 'Remarks / Notes',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: Consumer(
                          builder: (context, ref, _) {
                            final outstanding =
                                ref
                                    .watch(
                                      customerOutstandingProvider(
                                        _selectedCustomer!.id,
                                      ),
                                    )
                                    .value ??
                                0.0;
                            return ElevatedButton.icon(
                              onPressed: () => _recordPayment(
                                _selectedCustomer!,
                                outstanding,
                              ),
                              icon: const Icon(Icons.check_circle),
                              label: const Text(
                                'RECORD PAYMENT',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ] else ...[
                      const SizedBox(height: 100),
                      const Center(
                        child: Text(
                          'Search and select a customer to record a payment.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 24),

          // RIGHT PANEL: Recent Payments
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Payments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: recentPaymentsAsync.when(
                      data: (payments) {
                        if (payments.isEmpty)
                          return const Center(
                            child: Text('No payments recorded yet.'),
                          );
                        return ListView.separated(
                          itemCount: payments.length,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            final p = payments[index];
                            final customer = customers.firstWhere(
                              (c) => c.id == p.customerId,
                              orElse: () => customers.first,
                            );

                            IconData modeIcon = Icons.money;
                            Color modeColor = Colors.green;
                            if (p.paymentMode == 'UPI') {
                              modeIcon = Icons.qr_code;
                              modeColor = Colors.purple;
                            } else if (p.paymentMode == 'Bank Transfer') {
                              modeIcon = Icons.account_balance;
                              modeColor = Colors.blue;
                            }

                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: modeColor.withOpacity(0.1),
                                child: Icon(modeIcon, color: modeColor),
                              ),
                              title: Text(
                                customer.tradeName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '${DateFormat('dd MMM yyyy').format(p.paymentDate)} | ${p.paymentMode}\nRef: ${p.referenceNumber ?? '-'}',
                              ),
                              isThreeLine: true,
                              trailing: Text(
                                '₹${p.amount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, s) => Text('Error: $e'),
                    ),
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
