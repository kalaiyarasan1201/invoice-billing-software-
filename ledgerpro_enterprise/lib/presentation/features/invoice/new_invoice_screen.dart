import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:printing/printing.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../application/providers/database_provider.dart';
import '../../../application/services/pdf_service.dart';
import '../../../infrastructure/database/database.dart';

class SelectedInvoiceItem {
  final Product product;
  final TextEditingController qtyController;
  final TextEditingController priceController;

  SelectedInvoiceItem(this.product, {int initialQty = 1})
      : qtyController = TextEditingController(text: initialQty.toString()),
        priceController = TextEditingController(text: product.sellingRate.toStringAsFixed(2));

  double get quantity => double.tryParse(qtyController.text) ?? 0.0;
  double get sellingRate => double.tryParse(priceController.text) ?? 0.0;

  double get taxableValue => sellingRate * quantity;
  double get cgst => taxableValue * (product.gstRate / 2) / 100;
  double get sgst => taxableValue * (product.gstRate / 2) / 100;
  double get total => taxableValue + cgst + sgst;

  void dispose() {
    qtyController.dispose();
    priceController.dispose();
  }
}

class NewInvoiceScreen extends ConsumerStatefulWidget {
  const NewInvoiceScreen({super.key});

  @override
  ConsumerState<NewInvoiceScreen> createState() => _NewInvoiceScreenState();
}

class _NewInvoiceScreenState extends ConsumerState<NewInvoiceScreen> {
  final List<SelectedInvoiceItem> _selectedItems = [];
  TextEditingController? _productSearchController;
  FocusNode? _productSearchFocusNode;

  // Customer Controllers
  final _customerNameController = TextEditingController();
  final _customerGstinController = TextEditingController();
  final _customerPhoneController = TextEditingController();
  final _billingAddressController = TextEditingController();
  final _shippingAddressController = TextEditingController();

  // Bank Details Controllers
  final _bankNameController = TextEditingController(text: 'BANK OF BARODA');
  final _accountNumberController = TextEditingController(text: '35540500002434');
  final _branchNameController = TextEditingController(text: 'GANAPATHY,COIMBATORE');
  final _ifscCodeController = TextEditingController(text: 'BARB0GANAPA');

  // Invoice Details Controllers
  final _invoiceNumberController = TextEditingController();
  final _invoiceDateController = TextEditingController();
  final _placeOfSupplyController = TextEditingController(text: 'Tamil Nadu (33)');

  // Payment Controllers
  final _amountReceivedController = TextEditingController(text: '0.00');
  String _paymentMethod = 'Cash';
  final List<String> _paymentMethods = ['Cash', 'UPI', 'Credit Card', 'Debit Card', 'Bank Transfer', 'Cheque'];

  @override
  void initState() {
    super.initState();
    _amountReceivedController.addListener(() => setState(() {}));
    
    final now = DateTime.now();
    _invoiceDateController.text = '${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}';
    
    _generateNextInvoiceNumber();
  }

  Future<void> _generateNextInvoiceNumber() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final now = DateTime.now();
      final yearStr = '${now.year}';
      
      int lastNum = prefs.getInt('last_invoice_num') ?? 0;
      
      if (lastNum == 0) {
        // Fallback to database if SharedPreferences is empty
        final db = ref.read(databaseProvider);
        final lastInvoice = await (db.select(db.invoices)..orderBy([(t) => drift.OrderingTerm.desc(t.id)])..limit(1)).getSingleOrNull();
        if (lastInvoice != null) {
          final parts = lastInvoice.invoiceNumber.split('-');
          if (parts.length >= 3 && int.tryParse(parts.last) != null) {
            lastNum = int.parse(parts.last);
          }
        }
      }
      
      final nextNum = lastNum + 1;
      if (mounted) setState(() => _invoiceNumberController.text = 'INV-$yearStr-${nextNum.toString().padLeft(3, '0')}');
    } catch (_) {}
  }

  @override
  void dispose() {
    for (var item in _selectedItems) {
      item.dispose();
    }
    _customerNameController.dispose();
    _customerGstinController.dispose();
    _customerPhoneController.dispose();
    _billingAddressController.dispose();
    _shippingAddressController.dispose();
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _branchNameController.dispose();
    _ifscCodeController.dispose();
    _invoiceNumberController.dispose();
    _invoiceDateController.dispose();
    _placeOfSupplyController.dispose();
    _amountReceivedController.dispose();
    super.dispose();
  }

  void _addProduct(Product product) {
    setState(() {
      final existing = _selectedItems.where((i) => i.product.id == product.id).firstOrNull;
      if (existing != null) {
        final currentQty = existing.quantity;
        existing.qtyController.text = (currentQty + 1).toString();
      } else {
        final newItem = SelectedInvoiceItem(product);
        newItem.qtyController.addListener(() => setState(() {}));
        newItem.priceController.addListener(() => setState(() {}));
        _selectedItems.add(newItem);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      final item = _selectedItems.removeAt(index);
      item.dispose();
    });
  }

  double get _totalTaxable => _selectedItems.fold(0, (sum, item) => sum + item.taxableValue);
  double get _totalTax => _selectedItems.fold(0, (sum, item) => sum + item.cgst + item.sgst);
  double get _grandTotal => _totalTaxable + _totalTax;
  double get _amountReceived => double.tryParse(_amountReceivedController.text) ?? 0.0;
  double get _balanceDue => _grandTotal - _amountReceived;

  void _resetForm() {
    setState(() {
      for (var item in _selectedItems) {
        item.dispose();
      }
      _selectedItems.clear();
      
      _customerNameController.clear();
      _customerGstinController.clear();
      _customerPhoneController.clear();
      _billingAddressController.clear();
      _shippingAddressController.clear();
      
      _amountReceivedController.text = '0.00';
      _paymentMethod = 'Cash';
    });
    
    _generateNextInvoiceNumber();
  }

  InputDecoration _customInputDeco(String label, [IconData? icon]) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey.shade700, fontSize: 13),
      prefixIcon: icon != null ? Icon(icon, size: 18, color: const Color(0xFF1E3A8A)) : null,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);
    final products = productsAsync.value ?? [];
    final customersAsync = ref.watch(customersProvider);
    final customers = customersAsync.value ?? [];

    return Container(
      color: const Color(0xFFF4F6F8),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // LEFT SIDE: The Bill (Search & Grid)
          // ==========================================
          Expanded(
            flex: 7,
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
                      child: const Icon(Icons.receipt_long, color: Color(0xFF1E3A8A)),
                    ),
                    const SizedBox(width: 12),
                    const Text('Create New Invoice', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Product Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
                    border: Border.all(color: Colors.blue.shade100, width: 1.5),
                  ),
                  child: Autocomplete<Product>(
                    displayStringForOption: (Product option) => '${option.sku} - ${option.productName} (₹${option.sellingRate.toStringAsFixed(2)})',
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) return const Iterable<Product>.empty();
                      return products.where((Product option) {
                        return option.productName.toLowerCase().contains(textEditingValue.text.toLowerCase()) ||
                               option.sku.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (Product selection) {
                      _addProduct(selection);
                      Future.microtask(() {
                        _productSearchController?.clear();
                        _productSearchFocusNode?.requestFocus();
                      });
                    },
                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                      _productSearchController = textEditingController;
                      _productSearchFocusNode = focusNode;
                      
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Search SKU or Product Name to add... [Alt+A]',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF1E3A8A)),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                
                // Invoice Item Grid
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF0F172A),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                          child: const Row(
                            children: [
                              Expanded(flex: 1, child: Text('S.No', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14))),
                              Expanded(flex: 4, child: Text('Item Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14))),
                              Expanded(flex: 2, child: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.center)),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 8.0), child: Text('Price(₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 8.0), child: Text('Taxable(₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 8.0), child: Text('CGST', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 2, child: Padding(padding: EdgeInsets.only(right: 8.0), child: Text('SGST', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right))),
                              Expanded(flex: 3, child: Text('Amount(₹)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14), textAlign: TextAlign.right)),
                              SizedBox(width: 40),
                            ],
                          ),
                        ),
                        Expanded(
                          child: _selectedItems.isEmpty
                              ? Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_cart_checkout, size: 64, color: Colors.grey.shade300),
                                        const SizedBox(height: 16),
                                        Text('Your invoice is empty', style: TextStyle(color: Colors.grey.shade500, fontSize: 16)),
                                        Text('Use the search bar above to add products.', style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.separated(
                                  itemCount: _selectedItems.length,
                                  separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
                                  itemBuilder: (context, index) {
                                    final item = _selectedItems[index];
                                    final p = item.product;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(flex: 1, child: Text('${index + 1}', style: const TextStyle(color: Colors.black54, fontSize: 14))),
                                          Expanded(flex: 4, child: Text(p.productName, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A), fontSize: 14))),
                                          Expanded(
                                            flex: 2, 
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: TextField(
                                                      controller: item.qtyController,
                                                      keyboardType: TextInputType.number,
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                                      decoration: InputDecoration(
                                                        isDense: true,
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(p.uom, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                ],
                                              ),
                                            )
                                          ),
                                          Expanded(
                                            flex: 2, 
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 8.0),
                                              child: TextField(
                                                controller: item.priceController,
                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(fontSize: 15),
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                                ),
                                              ),
                                            )
                                          ),
                                          Expanded(flex: 2, child: Padding(padding: const EdgeInsets.only(right: 8.0), child: Text(item.taxableValue.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(color: Colors.black87, fontSize: 14)))),
                                          Expanded(flex: 2, child: Padding(padding: const EdgeInsets.only(right: 8.0), child: Text('${item.cgst.toStringAsFixed(2)}\n(${p.gstRate / 2}%)', textAlign: TextAlign.right, style: const TextStyle(fontSize: 13, color: Colors.black54)))),
                                          Expanded(flex: 2, child: Padding(padding: const EdgeInsets.only(right: 8.0), child: Text('${item.sgst.toStringAsFixed(2)}\n(${p.gstRate / 2}%)', textAlign: TextAlign.right, style: const TextStyle(fontSize: 13, color: Colors.black54)))),
                                          Expanded(flex: 3, child: Text(item.total.toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A), fontSize: 15))),
                                          SizedBox(
                                            width: 40,
                                            child: IconButton(
                                              icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                              onPressed: () => _removeItem(index),
                                              tooltip: 'Remove Item',
                                              splashRadius: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                        // Totals Panel inside the left bill section
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
                            border: Border(top: BorderSide(color: Colors.grey.shade200)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text('Taxable Amount: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                    SizedBox(width: 100, child: Text('₹ ${_totalTaxable.toStringAsFixed(2)}', textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                                    const SizedBox(width: 24),
                                    const Text('Total Tax: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                                    SizedBox(width: 100, child: Text('₹ ${_totalTax.toStringAsFixed(2)}', textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1E3A8A),
                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(11)),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('INR ${_numberToWords(_grandTotal)} Only', style: const TextStyle(fontSize: 13, color: Colors.white70, fontStyle: FontStyle.italic)),
                                    Row(
                                      children: [
                                        const Text('GRAND TOTAL', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, letterSpacing: 1.0, fontSize: 14)),
                                        const SizedBox(width: 16),
                                        Text('₹ ${_grandTotal.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // ==========================================
          // RIGHT SIDE: The Details & Forms
          // ==========================================
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Invoice Details Card
                        _buildFormCard(
                          title: 'INVOICE DETAILS',
                          children: [
                            TextField(controller: _invoiceNumberController, decoration: _customInputDeco('Invoice Number', Icons.receipt)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(child: TextField(controller: _invoiceDateController, decoration: _customInputDeco('Date (DD-MM-YYYY)', Icons.calendar_today))),
                                const SizedBox(width: 12),
                                Expanded(child: TextField(controller: _placeOfSupplyController, decoration: _customInputDeco('Place of Supply', Icons.map))),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Bill To Details Card
                        _buildFormCard(
                          title: 'BILL TO DETAILS',
                          children: [
                            Autocomplete<Customer>(
                              displayStringForOption: (Customer option) => option.tradeName,
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text.isEmpty) return const Iterable<Customer>.empty();
                                return customers.where((Customer option) {
                                  return option.tradeName.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (Customer selection) {
                                setState(() {
                                  _customerNameController.text = selection.tradeName;
                                  _customerGstinController.text = selection.gstin ?? '';
                                  _customerPhoneController.text = selection.phone ?? '';
                                  _billingAddressController.text = selection.billingAddress ?? '';
                                  _shippingAddressController.text = selection.shippingAddress ?? '';
                                });
                              },
                              fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                                // Keep the local controller updated if they type manually
                                textEditingController.addListener(() {
                                  _customerNameController.text = textEditingController.text;
                                });
                                // Initialize with existing text if any (e.g. after reset)
                                if (textEditingController.text != _customerNameController.text) {
                                  textEditingController.text = _customerNameController.text;
                                }
                                
                                return TextField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  decoration: _customInputDeco('Customer Name (Type to search)', Icons.person),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(child: TextField(controller: _customerGstinController, decoration: _customInputDeco('GSTIN', Icons.confirmation_num))),
                                const SizedBox(width: 12),
                                Expanded(child: TextField(controller: _customerPhoneController, decoration: _customInputDeco('Phone', Icons.phone))),
                              ],
                            ),
                            const SizedBox(height: 12),
                            TextField(controller: _billingAddressController, decoration: _customInputDeco('Billing Address', Icons.location_on), maxLines: 2),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Ship To Details Card
                        _buildFormCard(
                          title: 'SHIP TO DETAILS',
                          children: [
                            TextField(controller: _shippingAddressController, decoration: _customInputDeco('Shipping Address', Icons.local_shipping), maxLines: 2),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Bank Details Card
                        _buildFormCard(
                          title: 'BANK DETAILS',
                          children: [
                            TextField(controller: _bankNameController, decoration: _customInputDeco('Bank Name', Icons.account_balance)),
                            const SizedBox(height: 12),
                            TextField(controller: _accountNumberController, decoration: _customInputDeco('Account Number', Icons.numbers)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(child: TextField(controller: _branchNameController, decoration: _customInputDeco('Branch', Icons.store))),
                                const SizedBox(width: 12),
                                Expanded(child: TextField(controller: _ifscCodeController, decoration: _customInputDeco('IFSC Code', Icons.code))),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Payment Details Card
                        _buildFormCard(
                          title: 'PAYMENT DETAILS',
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    initialValue: _paymentMethod,
                                    decoration: _customInputDeco('Payment Mode', Icons.account_balance_wallet),
                                    items: _paymentMethods.map((String mode) {
                                      return DropdownMenuItem<String>(
                                        value: mode, 
                                        child: Text(mode, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          _paymentMethod = newValue;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: _amountReceivedController,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    decoration: _customInputDeco('Amount Recv.', Icons.money),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text('Balance Due:', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
                                    const SizedBox(width: 8),
                                    if (_balanceDue > 0)
                                      ElevatedButton.icon(
                                        onPressed: () => setState(() => _amountReceivedController.text = _grandTotal.toStringAsFixed(2)),
                                        icon: const Icon(Icons.done_all, size: 14),
                                        label: const Text('FULL PAY'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFE0E7FF),
                                          foregroundColor: const Color(0xFF1E3A8A),
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                          minimumSize: const Size(0, 26),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                          textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                                        ),
                                      ),
                                  ],
                                ),
                                Text('₹ ${_balanceDue.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: _balanceDue > 0 ? Colors.redAccent : Colors.green)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Pay & Print Button (Sticky at bottom right)
                ElevatedButton.icon(
                  onPressed: _saveAndPrintInvoice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.payments, size: 24),
                  label: const Text('PAY & PRINT BILL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10, offset: const Offset(0, 4))],
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  String _numberToWords(double amount) {
    if (amount == 0) return 'Zero';
    return 'Total Sum';
  }

  Future<void> _saveAndPrintInvoice() async {
    if (_selectedItems.isEmpty) return;
    final pdfService = PdfService();
    
    String sanitize(String? text) {
      if (text == null) return '';
      return text.replaceAll(RegExp(r'[^\x00-\x7F]'), '');
    }

    final company = Company(
      id: 1,
      companyName: 'M/S. HEAL AND SAFE SOLUTIONS',
      legalName: null,
      pan: null,
      cin: null,
      state: null,
      stateCode: null,
      logoPath: null,
      registeredAddress: '87-1, E,B,COLONY, IST STREET, GANDHI NAGAR, Tiruppur, Tamil Nadu (TN-33) 641603, IN',
      corporateAddress: '40/41, 60 FT. ROAD, DR.MUTHU\'S HOSPITAL BEHIND, PONTHOTTAM NAGAR, SARAVANAMPATTI, COIMBATORE, TN (33) 641035',
      phone: '+9199408 51118',
      email: 'admin@healandsafe.in',
      gstin: '33ACKPI7939N1ZZ',
      bankName: sanitize(_bankNameController.text),
      accountNumber: sanitize(_accountNumberController.text),
      ifsc: sanitize(_ifscCodeController.text),
      branch: sanitize(_branchNameController.text),
    );

    final db = ref.read(databaseProvider);

    var existingYears = await db.select(db.financialYears).get();
    int yearId = 1;
    if (existingYears.isEmpty) {
      yearId = await db.into(db.financialYears).insert(
        FinancialYearsCompanion.insert(
          name: '2026-27',
          startDate: DateTime(2026, 4, 1),
          endDate: DateTime(2027, 3, 31),
        ),
      );
    } else {
      yearId = existingYears.first.id;
    }

    final tradeNameStr = _customerNameController.text.isNotEmpty ? sanitize(_customerNameController.text) : 'CASH CUSTOMER';
    int customerId = 1;
    final customerQuery = db.select(db.customers)..where((t) => t.tradeName.equals(tradeNameStr));
    final existingCustomer = await customerQuery.getSingleOrNull();
    
    if (existingCustomer != null) {
      customerId = existingCustomer.id;
    } else {
      customerId = await db.into(db.customers).insert(
        CustomersCompanion.insert(
          customerCode: 'CUST-${DateTime.now().millisecondsSinceEpoch}',
          tradeName: tradeNameStr,
          phone: drift.Value(sanitize(_customerPhoneController.text)),
          billingAddress: drift.Value(sanitize(_billingAddressController.text)),
          shippingAddress: drift.Value(sanitize(_shippingAddressController.text)),
          gstin: drift.Value(sanitize(_customerGstinController.text)),
        )
      );
    }

    final customer = Customer(
      id: customerId,
      customerCode: 'CUST-${DateTime.now().millisecondsSinceEpoch}',
      tradeName: tradeNameStr,
      legalName: null,
      pan: null,
      phone: sanitize(_customerPhoneController.text),
      email: null,
      contactPerson: null,
      city: null,
      state: null,
      stateCode: null,
      openingBalance: 0.0,
      openingBalanceType: 'Dr',
      creditLimit: 0.0,
      creditDays: 0,
      priceTier: null,
      status: 'active',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      billingAddress: sanitize(_billingAddressController.text),
      shippingAddress: sanitize(_shippingAddressController.text),
      gstin: sanitize(_customerGstinController.text),
    );

    DateTime parsedDate = DateTime.now();
    try {
      final parts = _invoiceDateController.text.split('-');
      if (parts.length == 3) {
        parsedDate = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
      }
    } catch (_) {}

    final invoiceNumberStr = sanitize(_invoiceNumberController.text);
    final paymentStatusStr = _balanceDue <= 0 ? 'paid' : (_amountReceived > 0 ? 'partial' : 'unpaid');
    
    int invoiceId;
    try {
      invoiceId = await db.into(db.invoices).insert(
        InvoicesCompanion.insert(
          invoiceNumber: invoiceNumberStr,
          financialYearId: yearId,
          customerId: customerId,
          invoiceDate: parsedDate,
          dueDate: parsedDate.add(const Duration(days: 15)),
          salesExecutive: const drift.Value('SV'),
          placeOfSupply: drift.Value(sanitize(_placeOfSupplyController.text)),
          subtotal: drift.Value(_totalTaxable),
          discount: const drift.Value(0.0),
          taxableAmount: drift.Value(_totalTaxable),
          cgst: drift.Value(_totalTax / 2),
          sgst: drift.Value(_totalTax / 2),
          igst: const drift.Value(0),
          roundOff: const drift.Value(0.0),
          grandTotal: drift.Value(_grandTotal),
          amountReceived: drift.Value(_amountReceived),
          balanceDue: drift.Value(_balanceDue),
          paymentStatus: drift.Value(paymentStatusStr),
          paymentMethod: drift.Value(_paymentMethod),
        )
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: Invoice #$invoiceNumberStr already exists! Please change it.'),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    final invoice = Invoice(
      id: invoiceId,
      invoiceNumber: invoiceNumberStr,
      financialYearId: yearId,
      customerId: customerId,
      invoiceDate: parsedDate,
      dueDate: parsedDate.add(const Duration(days: 15)),
      salesExecutive: 'SV',
      placeOfSupply: sanitize(_placeOfSupplyController.text),
      subtotal: _totalTaxable,
      discount: 0.0,
      taxableAmount: _totalTaxable,
      cgst: _totalTax / 2,
      sgst: _totalTax / 2,
      igst: 0,
      roundOff: 0.0,
      grandTotal: _grandTotal,
      amountReceived: _amountReceived,
      balanceDue: _balanceDue,
      paymentStatus: paymentStatusStr,
      paymentMethod: _paymentMethod,
      ewayBillRequired: false,
      notes: null,
      createdAt: DateTime.now(),
    );

    for (var item in _selectedItems) {
      await db.into(db.invoiceItems).insert(
        InvoiceItemsCompanion.insert(
          invoiceId: invoiceId,
          productId: item.product.id,
          description: sanitize(item.product.productName),
          hsn: drift.Value(sanitize(item.product.hsn)),
          quantity: drift.Value(item.quantity),
          uom: drift.Value(sanitize(item.product.uom)),
          unitRate: drift.Value(item.sellingRate),
          taxableValue: drift.Value(item.taxableValue),
          gstRate: drift.Value(item.product.gstRate),
          cgst: drift.Value(item.cgst),
          sgst: drift.Value(item.sgst),
          total: drift.Value(item.total),
        )
      );
    }

    final List<InvoiceItem> items = _selectedItems.map((item) {
      return InvoiceItem(
        id: item.product.id,
        invoiceId: invoiceId,
        productId: item.product.id,
        description: sanitize(item.product.productName),
        hsn: sanitize(item.product.hsn),
        quantity: item.quantity,
        uom: sanitize(item.product.uom),
        unitRate: item.sellingRate,
        discountPercent: 0.0,
        taxableValue: item.taxableValue,
        gstRate: item.product.gstRate,
        cgst: item.cgst,
        sgst: item.sgst,
        igst: 0,
        total: item.total,
      );
    }).toList();

    final pdfBytes = await pdfService.generateInvoicePdf(
      invoice: invoice,
      company: company,
      customer: customer,
      items: items,
      documentTitle: 'QUOTATION',
    );

    final docsDir = await getApplicationDocumentsDirectory();
    final invoicesDir = Directory(p.join(docsDir.path, 'LedgerPro', 'Invoices'));
    if (!await invoicesDir.exists()) {
      await invoicesDir.create(recursive: true);
    }
    
    final fileName = 'Invoice_${invoice.invoiceNumber.replaceAll('/', '_')}.pdf';
    final file = File(p.join(invoicesDir.path, fileName));
    await file.writeAsBytes(pdfBytes);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Invoice saved successfully!'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Instantly open the print dialog
      Printing.layoutPdf(
        onLayout: (format) async => pdfBytes,
        name: fileName,
      );

      // Save to SharedPreferences so it persists across restarts
      final prefs = await SharedPreferences.getInstance();
      final parts = invoice.invoiceNumber.split('-');
      if (parts.length >= 3 && int.tryParse(parts.last) != null) {
        await prefs.setInt('last_invoice_num', int.parse(parts.last));
      }

      // Reset the form for the next bill
      _resetForm();
    }
  }
}
