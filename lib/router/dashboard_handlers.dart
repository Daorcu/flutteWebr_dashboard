import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:dashboard_1/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/dashboard_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });
}
