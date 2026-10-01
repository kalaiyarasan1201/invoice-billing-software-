import 'package:drift/drift.dart';

@DataClassName('Company')
class Companies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get companyName => text()();
  TextColumn get legalName => text().nullable()();
  TextColumn get gstin => text().nullable()();
  TextColumn get pan => text().nullable()();
  TextColumn get cin => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get registeredAddress => text().nullable()();
  TextColumn get corporateAddress => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get stateCode => text().nullable()();
  TextColumn get bankName => text().nullable()();
  TextColumn get accountNumber => text().nullable()();
  TextColumn get ifsc => text().nullable()();
  TextColumn get branch => text().nullable()();
  TextColumn get logoPath => text().nullable()();
}

@DataClassName('FinancialYear')
class FinancialYears extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  BoolColumn get isLocked => boolean().withDefault(const Constant(false))();
}

@DataClassName('Customer')
class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customerCode => text().unique()();
  TextColumn get tradeName => text()();
  TextColumn get legalName => text().nullable()();
  TextColumn get gstin => text().nullable()();
  TextColumn get pan => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get contactPerson => text().nullable()();
  TextColumn get billingAddress => text().nullable()();
  TextColumn get shippingAddress => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get stateCode => text().nullable()();
  RealColumn get openingBalance => real().withDefault(const Constant(0.0))();
  TextColumn get openingBalanceType => text().withDefault(const Constant('Dr'))();
  RealColumn get creditLimit => real().withDefault(const Constant(0.0))();
  IntColumn get creditDays => integer().withDefault(const Constant(0))();
  TextColumn get priceTier => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Product')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sku => text().unique()();
  TextColumn get barcode => text().nullable()();
  TextColumn get productName => text()();
  TextColumn get description => text().nullable()();
  TextColumn get hsn => text().nullable()();
  TextColumn get sac => text().nullable()();
  TextColumn get uom => text().withDefault(const Constant('PCS'))();
  RealColumn get purchaseRate => real().withDefault(const Constant(0.0))();
  RealColumn get sellingRate => real().withDefault(const Constant(0.0))();
  RealColumn get wholesaleRate => real().withDefault(const Constant(0.0))();
  RealColumn get gstRate => real().withDefault(const Constant(0.0))();
  RealColumn get openingStock => real().withDefault(const Constant(0.0))();
  RealColumn get currentStock => real().withDefault(const Constant(0.0))();
  RealColumn get minimumStock => real().withDefault(const Constant(0.0))();
  TextColumn get status => text().withDefault(const Constant('active'))();
}

@DataClassName('Invoice')
class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get invoiceNumber => text().unique()();
  IntColumn get financialYearId => integer().references(FinancialYears, #id)();
  IntColumn get customerId => integer().references(Customers, #id)();
  DateTimeColumn get invoiceDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  TextColumn get salesExecutive => text().nullable()();
  RealColumn get subtotal => real().withDefault(const Constant(0.0))();
  RealColumn get discount => real().withDefault(const Constant(0.0))();
  RealColumn get taxableAmount => real().withDefault(const Constant(0.0))();
  RealColumn get cgst => real().withDefault(const Constant(0.0))();
  RealColumn get sgst => real().withDefault(const Constant(0.0))();
  RealColumn get igst => real().withDefault(const Constant(0.0))();
  RealColumn get roundOff => real().withDefault(const Constant(0.0))();
  RealColumn get grandTotal => real().withDefault(const Constant(0.0))();
  RealColumn get amountReceived => real().withDefault(const Constant(0.0))();
  RealColumn get balanceDue => real().withDefault(const Constant(0.0))();
  TextColumn get paymentStatus => text().withDefault(const Constant('unpaid'))();
  TextColumn get placeOfSupply => text().nullable()();
  TextColumn get paymentMethod => text().nullable()();
  BoolColumn get ewayBillRequired => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('InvoiceItem')
class InvoiceItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoiceId => integer().references(Invoices, #id)();
  IntColumn get productId => integer().references(Products, #id)();
  TextColumn get description => text()();
  TextColumn get hsn => text().nullable()();
  RealColumn get quantity => real().withDefault(const Constant(1.0))();
  TextColumn get uom => text().withDefault(const Constant('PCS'))();
  RealColumn get unitRate => real().withDefault(const Constant(0.0))();
  RealColumn get discountPercent => real().withDefault(const Constant(0.0))();
  RealColumn get taxableValue => real().withDefault(const Constant(0.0))();
  RealColumn get gstRate => real().withDefault(const Constant(0.0))();
  RealColumn get cgst => real().withDefault(const Constant(0.0))();
  RealColumn get sgst => real().withDefault(const Constant(0.0))();
  RealColumn get igst => real().withDefault(const Constant(0.0))();
  RealColumn get total => real().withDefault(const Constant(0.0))();
}

@DataClassName('Payment')
class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();
  RealColumn get amount => real()();
  TextColumn get paymentMode => text().withDefault(const Constant('Cash'))();
  DateTimeColumn get paymentDate => dateTime().withDefault(currentDateAndTime)();
  TextColumn get referenceNumber => text().nullable()();
  TextColumn get remarks => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
