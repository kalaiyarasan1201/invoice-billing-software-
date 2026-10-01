import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTitleBar(),
          Expanded(
            child: Row(
              children: [
                _buildLeftNavigation(context),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(child: child),
              ],
            ),
          ),
          _buildStatusBar(),
        ],
      ),
    );
  }

  Widget _buildTitleBar() {
    return GestureDetector(
      onPanStart: (details) {
        windowManager.startDragging();
      },
      child: Container(
        height: 32,
        color: const Color(0xFF1976D2),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.account_balance_wallet, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const Text(
              'LedgerPro Enterprise | FY 2026-27 | ● Offline Ready',
              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.minimize, color: Colors.white, size: 18),
              onPressed: () => windowManager.minimize(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.crop_square, color: Colors.white, size: 16),
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  windowManager.unmaximize();
                } else {
                  windowManager.maximize();
                }
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 18),
              onPressed: () => windowManager.close(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftNavigation(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Material(
        color: Colors.white,
        child: ListView(
        children: [
          _buildNavItem(context, 'New Invoice', Icons.add_shopping_cart, '/new_invoice', '[F2]'),
          _buildNavItem(context, 'Invoice History', Icons.history, '/history', '[F3]'),
          _buildNavItem(context, 'Customers', Icons.people, '/customers', '[F4]'),
          _buildNavItem(context, 'Products / Items', Icons.inventory, '/products', '[F5]'),
          _buildNavItem(context, 'Payments', Icons.payment, '/payments', '[F6]'),
          _buildNavItem(context, 'Customer Ledger', Icons.menu_book, '/ledger', '[F7]'),
          _buildNavItem(context, 'Settings', Icons.settings, '/settings', '[F9]'),
        ],
      ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, IconData icon, String route, String shortcut) {
    final bool isActive = GoRouterState.of(context).uri.path == route;
    return ListTile(
      leading: Icon(icon, color: isActive ? const Color(0xFF1976D2) : Colors.grey[700], size: 20),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF1976D2) : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
      ),
      trailing: shortcut.isNotEmpty
          ? Text(shortcut, style: TextStyle(color: Colors.grey[500], fontSize: 11))
          : null,
      selected: isActive,
      selectedTileColor: const Color(0xFFE3F2FD),
      dense: true,
      onTap: () {
        if (route != GoRouterState.of(context).uri.path) {
           context.go(route);
        }
      },
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 24,
      color: const Color(0xFFE0E0E0),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const Row(
        children: [
          Icon(Icons.storage, size: 12, color: Colors.black54),
          SizedBox(width: 4),
          Text('SQLite Local DB', style: TextStyle(fontSize: 11, color: Colors.black87)),
          VerticalDivider(width: 16, thickness: 1, endIndent: 4, indent: 4),
          Text('● Auto Backup OK', style: TextStyle(fontSize: 11, color: Colors.black87)),
          Spacer(),
          Text('User: Admin | POS 01 | FY 2026-27', style: TextStyle(fontSize: 11, color: Colors.black87)),
        ],
      ),
    );
  }
}
