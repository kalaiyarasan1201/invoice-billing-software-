import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../infrastructure/database/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final productsProvider = StreamProvider<List<Product>>((ref) async* {
  final db = ref.watch(databaseProvider);
  
  // Seed data if empty
  final existingCount = await db.select(db.products).get();
  if (existingCount.isEmpty) {
    await db.into(db.products).insert(ProductsCompanion.insert(
      sku: 'FE-ABC-04',
      productName: 'Fire Extinguisher ABC 4KG',
      hsn: const drift.Value('84241000'),
      uom: const drift.Value('NOS'),
      purchaseRate: const drift.Value(900.0),
      sellingRate: const drift.Value(1200.0),
      gstRate: const drift.Value(18.0),
      currentStock: const drift.Value(50.0),
    ));
    await db.into(db.products).insert(ProductsCompanion.insert(
      sku: 'FA-HTR-24',
      productName: 'Fire Alarm Hooter 24V DC',
      hsn: const drift.Value('85311090'),
      uom: const drift.Value('NOS'),
      purchaseRate: const drift.Value(300.0),
      sellingRate: const drift.Value(450.0),
      gstRate: const drift.Value(18.0),
      currentStock: const drift.Value(100.0),
    ));
    await db.into(db.products).insert(ProductsCompanion.insert(
      sku: 'FA-MCP-01',
      productName: 'Manual Call Point (MCP)',
      hsn: const drift.Value('85365090'),
      uom: const drift.Value('NOS'),
      purchaseRate: const drift.Value(150.0),
      sellingRate: const drift.Value(250.0),
      gstRate: const drift.Value(18.0),
      currentStock: const drift.Value(200.0),
    ));
  }

  yield* db.select(db.products).watch();
});

final customersProvider = StreamProvider<List<Customer>>((ref) async* {
  final db = ref.watch(databaseProvider);
  yield* db.select(db.customers).watch();
});
