import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../../../application/providers/database_provider.dart';
import '../../../infrastructure/database/database.dart';


final customerInvoicesProvider = StreamProvider.family<List<Invoice>, int>((ref, customerId) {
  final db = ref.watch(databaseProvider);
  return (db.select(db.invoices)
        ..where((t) => t.customerId.equals(customerId))
        ..orderBy([(t) => drift.OrderingTerm.desc(t.invoiceDate)]))
      .watch();
});

class CustomerManagementScreen extends ConsumerStatefulWidget {
  const CustomerManagementScreen({super.key});

  @override
  ConsumerState<CustomerManagementScreen> createState() => _CustomerManagementScreenState();
}

class _CustomerManagementScreenState extends ConsumerState<CustomerManagementScreen> {
  String _searchQuery = '';
  Customer? _selectedCustomer;

  void _showAddEditCustomerDialog(BuildContext context, WidgetRef ref, {Customer? customer}) {
    final formKey = GlobalKey<FormState>();
    final tradeNameController = TextEditingController(text: customer?.tradeName ?? '');
    final phoneController = TextEditingController(text: customer?.phone ?? '');
    final emailController = TextEditingController(text: customer?.email ?? '');
    final gstinController = TextEditingController(text: customer?.gstin ?? '');
    final addressController = TextEditingController(text: customer?.billingAddress ?? '');
    final shippingAddressController = TextEditingController(text: customer?.shippingAddress ?? '');
    final cityController = TextEditingController(text: customer?.city ?? '');
    final stateController = TextEditingController(text: customer?.state ?? '');
    final stateCodeController = TextEditingController(text: customer?.stateCode ?? '');
    final openingBalanceController = TextEditingController(text: customer?.openingBalance.toString() ?? '0.0');
    final db = ref.read(databaseProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(customer == null ? 'Add Customer' : 'Edit Customer'),
          content: SizedBox(
            width: 400,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: tradeNameController,
                      decoration: const InputDecoration(labelText: 'Trade Name / Customer Name'),
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: gstinController,
                      decoration: const InputDecoration(labelText: 'GSTIN'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(labelText: 'Billing Address'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: shippingAddressController,
                      decoration: const InputDecoration(labelText: 'Shipping Address'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: cityController,
                            decoration: const InputDecoration(labelText: 'City'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: stateController,
                            decoration: const InputDecoration(labelText: 'State'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: stateCodeController,
                            decoration: const InputDecoration(labelText: 'State Code'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: openingBalanceController,
                      decoration: const InputDecoration(labelText: 'Opening Balance'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final companion = CustomersCompanion(
                    tradeName: drift.Value(tradeNameController.text),
                    phone: drift.Value(phoneController.text.isNotEmpty ? phoneController.text : null),
                    email: drift.Value(emailController.text.isNotEmpty ? emailController.text : null),
                    gstin: drift.Value(gstinController.text.isNotEmpty ? gstinController.text : null),
                    billingAddress: drift.Value(addressController.text.isNotEmpty ? addressController.text : null),
                    shippingAddress: drift.Value(shippingAddressController.text.isNotEmpty ? shippingAddressController.text : null),
                    city: drift.Value(cityController.text.isNotEmpty ? cityController.text : null),
                    state: drift.Value(stateController.text.isNotEmpty ? stateController.text : null),
                    stateCode: drift.Value(stateCodeController.text.isNotEmpty ? stateCodeController.text : null),
                    openingBalance: drift.Value(double.tryParse(openingBalanceController.text) ?? 0.0),
                  );
                  if (customer == null) {
                    await db.into(db.customers).insert(
                      companion.copyWith(
                        customerCode: drift.Value('CUST-${DateTime.now().millisecondsSinceEpoch}'),
                      ),
                    );
                  } else {
                    await (db.update(db.customers)..where((t) => t.id.equals(customer.id))).write(companion);
                    // Refresh selected customer if it was edited
                    if (_selectedCustomer?.id == customer.id) {
                      final updated = await (db.select(db.customers)..where((t) => t.id.equals(customer.id))).getSingle();
                      setState(() {
                        _selectedCustomer = updated;
                      });
                    }
                  }
                  if (context.mounted) Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);

    return Row(
      children: [
        // Left Panel - Customer List
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Customers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () => _showAddEditCustomerDialog(context, ref),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add'),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search Customers',
                    hintText: 'Search by Name, Phone...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.toLowerCase();
                    });
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: customersAsync.when(
                    data: (allCustomers) {
                      final customers = allCustomers.where((c) {
                        return c.tradeName.toLowerCase().contains(_searchQuery) ||
                               (c.phone?.toLowerCase().contains(_searchQuery) ?? false) ||
                               (c.gstin?.toLowerCase().contains(_searchQuery) ?? false);
                      }).toList();

                      if (customers.isEmpty) {
                        return const Center(child: Text('No customers found.'));
                      }
                      return ListView.separated(
                        itemCount: customers.length,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final customer = customers[index];
                          final isSelected = _selectedCustomer?.id == customer.id;
                          return ListTile(
                            selected: isSelected,
                            selectedTileColor: Colors.blue.withOpacity(0.1),
                            title: Text(customer.tradeName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${customer.customerCode} | ${customer.phone ?? 'No Phone'}'),
                            onTap: () {
                              setState(() {
                                _selectedCustomer = customer;
                              });
                            },
                          );
                        },
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Center(child: Text('Error: $error')),
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(width: 1, thickness: 1),
        // Right Panel - Customer Details
        Expanded(
          flex: 2,
          child: _selectedCustomer == null
              ? const Center(child: Text('Select a customer to view details', style: TextStyle(color: Colors.grey, fontSize: 16)))
              : _buildCustomerDetails(context, ref, _selectedCustomer!),
        ),
      ],
    );
  }

  Widget _buildCustomerDetails(BuildContext context, WidgetRef ref, Customer customer) {
    final invoicesAsync = ref.watch(customerInvoicesProvider(customer.id));
    final dateFormat = DateFormat('dd MMM yyyy');

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customer.tradeName, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Customer ID: ${customer.customerCode}', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                tooltip: 'Edit Customer',
                onPressed: () => _showAddEditCustomerDialog(context, ref, customer: customer),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(Icons.phone, 'Mobile', customer.phone ?? '-'),
                    const SizedBox(height: 12),
                    _buildInfoRow(Icons.confirmation_num, 'GSTIN', customer.gstin ?? '-'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(Icons.location_on, 'Billing Address', customer.billingAddress ?? '-'),
                    if (customer.shippingAddress != null && customer.shippingAddress!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      _buildInfoRow(Icons.local_shipping, 'Shipping Address', customer.shippingAddress!),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(Icons.location_city, 'City / State', 
                      '${customer.city ?? '-'}, ${customer.state ?? '-'}${customer.stateCode != null ? ' (${customer.stateCode})' : ''}'),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 48),
          const Text('Financial Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          invoicesAsync.when(
            data: (invoices) {
              double totalSales = 0.0;
              double totalPaid = 0.0;
              for (var inv in invoices) {
                totalSales += inv.grandTotal;
                totalPaid += inv.amountReceived;
              }
              double outstanding = (totalSales - totalPaid) + customer.openingBalance;

              return Row(
                children: [
                  _buildStatCard('Opening Balance', '₹${customer.openingBalance.toStringAsFixed(2)}', Colors.orange),
                  const SizedBox(width: 16),
                  _buildStatCard('Total Sales', '₹${totalSales.toStringAsFixed(2)}', Colors.blue),
                  const SizedBox(width: 16),
                  _buildStatCard('Total Paid', '₹${totalPaid.toStringAsFixed(2)}', Colors.green),
                  const SizedBox(width: 16),
                  _buildStatCard('Outstanding Credit', '₹${outstanding.toStringAsFixed(2)}', outstanding > 0 ? Colors.red : Colors.green),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text('Error: $e'),
          ),
          const SizedBox(height: 32),
          const Text('Invoice History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Expanded(
            child: invoicesAsync.when(
              data: (invoices) {
                if (invoices.isEmpty) {
                  return const Center(child: Text('No invoices found for this customer.'));
                }
                return ListView.builder(
                  itemCount: invoices.length,
                  itemBuilder: (context, index) {
                    final inv = invoices[index];
                    return Card(
                      elevation: 1,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: inv.paymentStatus == 'paid' ? Colors.green.shade100 : Colors.orange.shade100,
                          child: Icon(
                            inv.paymentStatus == 'paid' ? Icons.check : Icons.access_time,
                            color: inv.paymentStatus == 'paid' ? Colors.green : Colors.orange,
                          ),
                        ),
                        title: Text(inv.invoiceNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(dateFormat.format(inv.invoiceDate)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('₹${inv.grandTotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(inv.paymentStatus.toUpperCase(), style: TextStyle(
                              color: inv.paymentStatus == 'paid' ? Colors.green : Colors.orange,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
