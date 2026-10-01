import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../../application/providers/database_provider.dart';
import '../../../infrastructure/database/database.dart';

class AddProductDialog extends ConsumerStatefulWidget {
  final Product? product;
  const AddProductDialog({super.key, this.product});

  @override
  ConsumerState<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends ConsumerState<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  final _skuController = TextEditingController();
  final _nameController = TextEditingController();
  final _hsnController = TextEditingController();
  final _uomController = TextEditingController(text: 'NOS');
  final _purchaseRateController = TextEditingController();
  final _sellingRateController = TextEditingController();
  final _gstRateController = TextEditingController(text: '18.0');
  final _stockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      final p = widget.product!;
      _skuController.text = p.sku;
      _nameController.text = p.productName;
      _hsnController.text = p.hsn ?? '';
      _uomController.text = p.uom;
      _purchaseRateController.text = p.purchaseRate.toString();
      _sellingRateController.text = p.sellingRate.toString();
      _gstRateController.text = p.gstRate.toString();
      _stockController.text = p.currentStock.toString();
    }
  }

  @override
  void dispose() {
    _skuController.dispose();
    _nameController.dispose();
    _hsnController.dispose();
    _uomController.dispose();
    _purchaseRateController.dispose();
    _sellingRateController.dispose();
    _gstRateController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  void _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      final db = ref.read(databaseProvider);
      
      final product = ProductsCompanion.insert(
        sku: _skuController.text.trim(),
        productName: _nameController.text.trim(),
        hsn: drift.Value(_hsnController.text.trim()),
        uom: drift.Value(_uomController.text.trim()),
        purchaseRate: drift.Value(double.tryParse(_purchaseRateController.text) ?? 0.0),
        sellingRate: drift.Value(double.tryParse(_sellingRateController.text) ?? 0.0),
        gstRate: drift.Value(double.tryParse(_gstRateController.text) ?? 0.0),
        currentStock: drift.Value(double.tryParse(_stockController.text) ?? 0.0),
      );

      try {
        if (widget.product == null) {
          await db.into(db.products).insert(product);
        } else {
          await (db.update(db.products)..where((tbl) => tbl.id.equals(widget.product!.id))).write(product);
        }
        if (mounted) Navigator.of(context).pop();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding product: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.product == null ? 'Add New Product' : 'Edit Product'),
      content: SizedBox(
        width: 500,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _skuController,
                        decoration: const InputDecoration(labelText: 'SKU *', border: OutlineInputBorder()),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Product Name *', border: OutlineInputBorder()),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _hsnController,
                        decoration: const InputDecoration(labelText: 'HSN/SAC', border: OutlineInputBorder()),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _uomController,
                        decoration: const InputDecoration(labelText: 'UOM', border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _purchaseRateController,
                        decoration: const InputDecoration(labelText: 'Purchase Rate', border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _sellingRateController,
                        decoration: const InputDecoration(labelText: 'Selling Rate *', border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _gstRateController,
                        decoration: const InputDecoration(labelText: 'GST Rate (%)', border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _stockController,
                        decoration: const InputDecoration(labelText: 'Opening Stock', border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveProduct,
          child: const Text('Save Product'),
        ),
      ],
    );
  }
}
