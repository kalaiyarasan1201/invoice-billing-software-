import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_shell.dart';
import '../features/invoice/new_invoice_screen.dart';
import '../features/invoice/invoice_history_screen.dart';
import '../features/products/product_management_screen.dart';
import '../features/customers/customer_management_screen.dart';
import '../features/payments/payments_screen.dart';
import '../features/ledger/ledger_screen.dart';
import '../features/placeholder/placeholder_screen.dart';
import '../features/settings/settings_screen.dart';
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/new_invoice',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/new_invoice',
          builder: (context, state) => const NewInvoiceScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductManagementScreen(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const InvoiceHistoryScreen(),
        ),
        GoRoute(
          path: '/customers',
          builder: (context, state) => const CustomerManagementScreen(),
        ),
        GoRoute(
          path: '/payments',
          builder: (context, state) => const PaymentsScreen(),
        ),
        GoRoute(
          path: '/ledger',
          builder: (context, state) => const LedgerScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
