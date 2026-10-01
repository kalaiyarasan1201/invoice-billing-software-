import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefs = prefs;
    });
  }

  void _showEditDialog(String title, List<String> keys, List<String> labels) {
    if (_prefs == null) return;
    
    final controllers = keys.map((k) => TextEditingController(text: _prefs!.getString(k) ?? '')).toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(keys.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    controller: controllers[index],
                    decoration: InputDecoration(labelText: labels[index], border: const OutlineInputBorder()),
                  ),
                );
              }),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () async {
                for (int i = 0; i < keys.length; i++) {
                  await _prefs!.setString(keys[i], controllers[i].text);
                }
                setState(() {});
                if (mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title saved successfully.')));
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showInfoDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_prefs == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black87,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildSettingsSection(
            title: 'Business Profile',
            icon: Icons.storefront,
            children: [
              _buildSettingItem(
                Icons.business, 'Company Details', 
                _prefs!.getString('company_name')?.isNotEmpty == true ? _prefs!.getString('company_name')! : 'Name, Address, Phone, Email',
                onTap: () => _showEditDialog('Company Details', ['company_name', 'company_address', 'company_phone', 'company_email'], ['Name', 'Address', 'Phone', 'Email'])
              ),
              _buildSettingItem(
                Icons.account_balance, 'Tax Information', 
                _prefs!.getString('company_gstin')?.isNotEmpty == true ? 'GSTIN: ${_prefs!.getString('company_gstin')}' : 'GSTIN / VAT Number, PAN',
                onTap: () => _showEditDialog('Tax Information', ['company_gstin', 'company_pan'], ['GSTIN / VAT', 'PAN Number'])
              ),
              _buildSettingItem(
                Icons.monetization_on, 'Currency', 
                _prefs!.getString('currency') ?? 'Default currency (e.g., USD, INR)',
                onTap: () => _showEditDialog('Currency', ['currency'], ['Currency Symbol / Code'])
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Invoice Preferences',
            icon: Icons.receipt_long,
            children: [
              _buildSettingItem(
                Icons.format_list_numbered, 'Invoice Numbering', 
                'Prefix: ${_prefs!.getString('inv_prefix') ?? 'INV-'}',
                onTap: () => _showEditDialog('Invoice Numbering', ['inv_prefix', 'inv_sequence'], ['Prefix (e.g. INV-)', 'Start Sequence'])
              ),
              _buildSettingItem(
                Icons.gavel, 'Terms & Conditions', 
                'Default T&C printed on invoices',
                onTap: () => _showEditDialog('Terms & Conditions', ['terms_conditions'], ['Terms Text (Markdown/Plain text)'])
              ),
              _buildSettingItem(
                Icons.print, 'Print Settings', 
                'Paper size: ${_prefs!.getString('paper_size') ?? 'A4'}',
                onTap: () => _showEditDialog('Print Settings', ['paper_size', 'margins'], ['Paper Size (A4, Thermal)', 'Margins'])
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Taxes & Units',
            icon: Icons.percent,
            children: [
              _buildSettingItem(
                Icons.sell, 'Tax Rates', 
                'Default Tax Rate: ${_prefs!.getString('default_tax') ?? '18%'}',
                onTap: () => _showEditDialog('Tax Rates', ['default_tax'], ['Default Tax Percentage'])
              ),
              _buildSettingItem(
                Icons.scale, 'Measurement Units', 
                'Default Unit: ${_prefs!.getString('default_uom') ?? 'NOS'}',
                onTap: () => _showEditDialog('Measurement Units', ['default_uom'], ['Default Unit (e.g. NOS, KG)'])
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            title: 'Data & Backup',
            icon: Icons.save,
            children: [
              _buildSettingItem(
                Icons.backup, 'Auto Backup', 
                'Configure local backup frequency',
                onTap: () => _showInfoDialog('Auto Backup', 'Auto backup is scheduled daily to Documents/LedgerPro/Backups.')
              ),
              _buildSettingItem(
                Icons.import_export, 'Export Data', 
                'Export to Excel / CSV',
                onTap: () => _showInfoDialog('Export Data', 'Export functionality is ready. Check Documents/LedgerPro/Exports folder.')
              ),
              _buildSettingItem(
                Icons.restore, 'Restore Data', 
                'Restore from a previous backup file', 
                isDestructive: true,
                onTap: () => _showInfoDialog('Restore Data', 'To restore data, please copy your backup db file over the main db file manually for now.')
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({required String title, required IconData icon, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF1976D2), size: 22),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1976D2)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Column(
            children: _intersperse(children, const Divider(height: 1)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle, {bool isDestructive = false, VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive ? Colors.red.shade50 : Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : Colors.blue.shade700, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
    );
  }

  Iterable<Widget> _intersperse(Iterable<Widget> iterable, Widget separator) sync* {
    final iterator = iterable.iterator;
    if (!iterator.moveNext()) return;
    yield iterator.current;
    while (iterator.moveNext()) {
      yield separator;
      yield iterator.current;
    }
  }
}
