import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:dashboard_1/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/login_view.dart';
import 'package:dashboard_1/ui/views/register_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });
}
