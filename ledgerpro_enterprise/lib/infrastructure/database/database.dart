import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Companies,
  FinancialYears,
  Customers,
  Products,
  Invoices,
  InvoiceItems,
  Payments,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(invoices, invoices.paymentMethod);
          }
          if (from < 3) {
            await m.createTable(payments);
          }
        },
        onCreate: (Migrator m) async {
          await m.createAll();
          
          // Seed initial products
          await into(products).insert(ProductsCompanion.insert(
            sku: 'FE-ABC-04',
            productName: 'Fire Extinguisher ABC 4KG',
            hsn: const Value('84241000'),
            uom: const Value('NOS'),
            purchaseRate: const Value(900.0),
            sellingRate: const Value(1200.0),
            gstRate: const Value(18.0),
            currentStock: const Value(50.0),
          ));

          await into(products).insert(ProductsCompanion.insert(
            sku: 'FA-HTR-24',
            productName: 'Fire Alarm Hooter 24V DC',
            hsn: const Value('85311090'),
            uom: const Value('NOS'),
            purchaseRate: const Value(300.0),
            sellingRate: const Value(450.0),
            gstRate: const Value(18.0),
            currentStock: const Value(100.0),
          ));

          await into(products).insert(ProductsCompanion.insert(
            sku: 'FA-MCP-01',
            productName: 'Manual Call Point (MCP)',
            hsn: const Value('85365090'),
            uom: const Value('NOS'),
            purchaseRate: const Value(150.0),
            sellingRate: const Value(250.0),
            gstRate: const Value(18.0),
            currentStock: const Value(200.0),
          ));
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'LedgerPro', 'Data', 'LedgerPro.db'));

    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    sqlite3.tempDirectory = (await getTemporaryDirectory()).path;

    return NativeDatabase.createInBackground(file);
  });
}
