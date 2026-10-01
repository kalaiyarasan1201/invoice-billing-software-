import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/providers/database_provider.dart';
import 'add_product_dialog.dart';

class ProductManagementScreen extends ConsumerStatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  ConsumerState<ProductManagementScreen> createState() => _ProductManagementScreenState();
}

class _ProductManagementScreenState extends ConsumerState<ProductManagementScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Products / Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AddProductDialog(),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Product'),
              )
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search Products',
              hintText: 'Search by SKU or Product Name...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Card(
              child: productsAsync.when(
                data: (allProducts) {
                  final products = allProducts.where((p) {
                    return p.productName.toLowerCase().contains(_searchQuery) ||
                           p.sku.toLowerCase().contains(_searchQuery);
                  }).toList();

                  if (products.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: DataTable(
                        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                        columns: const [
                          DataColumn(label: Text('SKU')),
                          DataColumn(label: Text('Product Name')),
                          DataColumn(label: Text('HSN/SAC')),
                          DataColumn(label: Text('Selling Rate')),
                          DataColumn(label: Text('GST Rate')),
                          DataColumn(label: Text('Stock')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: products.map((product) {
                          return DataRow(
                            cells: [
                              DataCell(Text(product.sku)),
                              DataCell(Text(product.productName)),
                              DataCell(Text(product.hsn ?? '-')),
                              DataCell(Text('₹${product.sellingRate.toStringAsFixed(2)}')),
                              DataCell(Text('${product.gstRate.toStringAsFixed(1)}%')),
                              DataCell(Text('${product.currentStock} ${product.uom}')),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue, size: 18),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AddProductDialog(product: product),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
