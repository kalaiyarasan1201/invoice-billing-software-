import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../../infrastructure/database/database.dart';
import 'database_provider.dart';

class InvoiceWithCustomer {
  final Invoice invoice;
  final Customer customer;
  InvoiceWithCustomer(this.invoice, this.customer);
}

class InvoiceDateFilterNotifier extends Notifier<DateTime?> {
  @override
  DateTime? build() => null;
  void setDate(DateTime? date) => state = date;
}

final invoiceDateFilterProvider = NotifierProvider<InvoiceDateFilterNotifier, DateTime?>(() => InvoiceDateFilterNotifier());

class InvoiceSearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';
  void setQuery(String query) => state = query;
}

final invoiceSearchQueryProvider = NotifierProvider<InvoiceSearchQueryNotifier, String>(() => InvoiceSearchQueryNotifier());

final invoiceHistoryProvider = StreamProvider<List<InvoiceWithCustomer>>((ref) async* {
  final db = ref.watch(databaseProvider);
  final filterDate = ref.watch(invoiceDateFilterProvider);
  final searchQuery = ref.watch(invoiceSearchQueryProvider);
  
  final existingInvoices = await db.select(db.invoices).get();
  if (existingInvoices.isEmpty) {
    // Seed financial year if needed
    var existingYears = await db.select(db.financialYears).get();
    if (existingYears.isEmpty) {
      await db.into(db.financialYears).insert(
        FinancialYearsCompanion.insert(
          name: '2026-27',
          startDate: DateTime(2026, 4, 1),
          endDate: DateTime(2027, 3, 31),
        ),
      );
    }
  }

  final query = db.select(db.invoices).join([
    drift.innerJoin(db.customers, db.customers.id.equalsExp(db.invoices.customerId)),
  ]);
  
  if (filterDate != null) {
    final startOfDay = DateTime(filterDate.year, filterDate.month, filterDate.day);
    final nextDay = startOfDay.add(const Duration(days: 1));
    query.where(db.invoices.invoiceDate.isBiggerOrEqualValue(startOfDay) & db.invoices.invoiceDate.isSmallerThanValue(nextDay));
  }
  
  if (searchQuery.isNotEmpty) {
    query.where(db.invoices.invoiceNumber.like('%$searchQuery%'));
  }
  
  query.orderBy([drift.OrderingTerm.desc(db.invoices.invoiceDate)]);
  
  yield* query.watch().map((rows) {
    return rows.map((row) {
      return InvoiceWithCustomer(
        row.readTable(db.invoices),
        row.readTable(db.customers),
      );
    }).toList();
  });
});
