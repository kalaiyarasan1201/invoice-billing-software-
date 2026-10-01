import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../infrastructure/database/database.dart';

class PdfService {
  Future<Uint8List> generateInvoicePdf({
    required Invoice invoice,
    required Company company,
    required Customer customer,
    required List<InvoiceItem> items,
    String documentTitle = 'INVOICE',
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        footer: (context) => _buildFooter(company),
        build: (context) {
          return [
            _buildHeader(company, invoice, documentTitle),
            pw.SizedBox(height: 20),
            _buildAddresses(company, customer, invoice),
            pw.SizedBox(height: 20),
            _buildItemsTable(items),
            pw.SizedBox(height: 20),
            _buildTotalsAndBankDetails(company, invoice),
          ];
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader(Company company, Invoice invoice, String title) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        // Logo and Company Details
        pw.Expanded(
          flex: 6,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Placeholder for Logo
              pw.Container(
                width: 60,
                height: 60,
                decoration: const pw.BoxDecoration(
                  color: PdfColors.orange200,
                  shape: pw.BoxShape.circle,
                ),
                child: pw.Center(child: pw.Text('LOGO', style: const pw.TextStyle(color: PdfColors.white))),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                company.companyName.toUpperCase(),
                style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900),
              ),
              if (company.registeredAddress != null)
                pw.Text('REG. OFF: ${company.registeredAddress}', style: const pw.TextStyle(fontSize: 11)),
              if (company.phone != null)
                pw.Text(company.phone!, style: const pw.TextStyle(fontSize: 11)),
              if (company.email != null)
                pw.Text(company.email!, style: const pw.TextStyle(fontSize: 11)),
              if (company.gstin != null)
                pw.Text('GSTIN: ${company.gstin}', style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
              if (company.corporateAddress != null)
                pw.Text('Corporate Office: ${company.corporateAddress}', style: const pw.TextStyle(fontSize: 11)),
            ],
          ),
        ),
        // Document Info
        pw.Expanded(
          flex: 4,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(title, style: pw.TextStyle(fontSize: 22, color: PdfColors.blue900, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 6),
              pw.Text('Invoice No: ${invoice.invoiceNumber}', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 12),
              _buildDocumentInfoRow('Issue Date:', _formatDate(invoice.invoiceDate)),
              _buildDocumentInfoRow('Due Date:', _formatDate(invoice.dueDate)),
              _buildDocumentInfoRow('Executive Name:', invoice.salesExecutive ?? '-'),
              _buildDocumentInfoRow('Place of Supply:', invoice.placeOfSupply ?? '-'),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildDocumentInfoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: const pw.TextStyle(fontSize: 9, color: PdfColors.blueGrey800)),
          pw.Text(value, style: const pw.TextStyle(fontSize: 9)),
        ],
      ),
    );
  }

  pw.Widget _buildAddresses(Company company, Customer customer, Invoice invoice) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Bill To', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 4),
              pw.Text(customer.tradeName.toUpperCase(), style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900)),
              if (customer.billingAddress != null)
                pw.Text(customer.billingAddress!, style: const pw.TextStyle(fontSize: 11)),
              if (customer.city != null || customer.state != null)
                pw.Text('${customer.city ?? ''}, ${customer.state ?? ''}', style: const pw.TextStyle(fontSize: 11)),
              if (customer.gstin != null)
                pw.Text('GSTIN: ${customer.gstin}', style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
            ],
          ),
        ),
        pw.SizedBox(width: 20),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Ship To', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 4),
              if (customer.shippingAddress != null)
                pw.Text(customer.shippingAddress!, style: const pw.TextStyle(fontSize: 11))
              else
                pw.Text('Same as Billing Address', style: const pw.TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildItemsTable(List<InvoiceItem> items) {
    const tableHeaders = ['S.No', 'Item Description', 'HSN/SAC', 'Qty\nUoM', 'Price\n(INR)', 'Taxable Value\n(INR)', 'CGST\n(INR)', 'SGST\n(INR)', 'Amount\n(INR)'];

    return pw.TableHelper.fromTextArray(
      headers: tableHeaders,
      data: List<List<dynamic>>.generate(items.length, (index) {
        final item = items[index];
        return [
          '${index + 1}',
          item.description,
          item.hsn ?? '-',
          '${item.quantity}\n${item.uom}',
          item.unitRate.toStringAsFixed(2),
          item.taxableValue.toStringAsFixed(2),
          '${item.cgst.toStringAsFixed(2)}\n${item.gstRate / 2}%',
          '${item.sgst.toStringAsFixed(2)}\n${item.gstRate / 2}%',
          item.total.toStringAsFixed(2),
        ];
      }),
      headerStyle: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: PdfColors.blue800),
      cellStyle: const pw.TextStyle(fontSize: 9),
      cellPadding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.center,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
        5: pw.Alignment.centerRight,
        6: pw.Alignment.centerRight,
        7: pw.Alignment.centerRight,
        8: pw.Alignment.centerRight,
      },
      columnWidths: {
        0: const pw.FlexColumnWidth(1.2),
        1: const pw.FlexColumnWidth(4),
        2: const pw.FlexColumnWidth(2),
        3: const pw.FlexColumnWidth(1.5),
        4: const pw.FlexColumnWidth(2),
        5: const pw.FlexColumnWidth(2.5),
        6: const pw.FlexColumnWidth(2),
        7: const pw.FlexColumnWidth(2),
        8: const pw.FlexColumnWidth(2.5),
      },
      border: pw.TableBorder.all(color: PdfColors.grey300, width: 0.5),
    );
  }

  pw.Widget _buildTotalsAndBankDetails(Company company, Invoice invoice) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 6,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Bank Name: ${company.bankName ?? '-'}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('Account Number: ${company.accountNumber ?? '-'}', style: const pw.TextStyle(fontSize: 10)),
              pw.Text('Branch Name: ${company.branch ?? '-'}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Text('IFSC Code: ${company.ifsc ?? '-'}', style: const pw.TextStyle(fontSize: 10)),
            ],
          ),
        ),
        pw.Expanded(
          flex: 4,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              _buildTotalRow('Total Taxable Value', invoice.taxableAmount),
              _buildTotalRow('Total Tax Amount', invoice.cgst + invoice.sgst + invoice.igst),
              _buildTotalRow('Total Value (in figure)', invoice.grandTotal),
              pw.SizedBox(height: 4),
              pw.Text(
                'Total Value (in words)',
                style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
              ),
              pw.Text(
                'INR ${_numberToWords(invoice.grandTotal)} Only',
                style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: PdfColors.blue900),
                textAlign: pw.TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildTotalRow(String label, double amount) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          pw.Text('INR ${amount.toStringAsFixed(2)}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );
  }

  pw.Widget _buildFooter(Company company) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Terms & Conditions', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            pw.Text('PAYMENTS TERMS - 100% AGAINST P.O DELIVERY SCHEDULE', style: pw.TextStyle(fontSize: 8, fontStyle: pw.FontStyle.italic)),
            pw.Text('GST - AS APPLICABLE', style: pw.TextStyle(fontSize: 8, fontStyle: pw.FontStyle.italic)),
            pw.Text('DELIVERY SCHEDULE - WITHIN 3 WEEKS AS PER YOUR P.O', style: pw.TextStyle(fontSize: 8, fontStyle: pw.FontStyle.italic)),
            pw.Text('DELIVERY CHARGES - EXTRA', style: pw.TextStyle(fontSize: 8, fontStyle: pw.FontStyle.italic)),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.SizedBox(height: 40), // Space for signature
            pw.Text('Authorized signature', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} - ${_getMonth(date.month)} - ${date.year}';
  }

  String _getMonth(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String _numberToWords(double amount) {
    if (amount == 0) return 'Zero';
    final int intPart = amount.floor();
    final int decPart = ((amount - intPart) * 100).round();
    
    String convert(int n) {
      if (n == 0) return '';
      if (n < 20) return '${['','One','Two','Three','Four','Five','Six','Seven','Eight','Nine','Ten','Eleven','Twelve','Thirteen','Fourteen','Fifteen','Sixteen','Seventeen','Eighteen','Nineteen'][n]} ';
      if (n < 100) return '${['','','Twenty','Thirty','Forty','Fifty','Sixty','Seventy','Eighty','Ninety'][n ~/ 10]} ${convert(n % 10)}';
      if (n < 1000) return '${convert(n ~/ 100)}Hundred ${convert(n % 100)}';
      if (n < 100000) return '${convert(n ~/ 1000)}Thousand ${convert(n % 1000)}';
      if (n < 10000000) return '${convert(n ~/ 100000)}Lakh ${convert(n % 100000)}';
      return '${convert(n ~/ 10000000)}Crore ${convert(n % 10000000)}';
    }
    
    String res = convert(intPart).trim();
    if (decPart > 0) {
      res += ' And ${convert(decPart).trim()} Paisa';
    }
    return res.isEmpty ? 'Zero' : res;
  }
}
