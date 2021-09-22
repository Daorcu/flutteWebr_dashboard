import 'package:dashboard_1/ui/views/user_view.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/categories_view.dart';
import 'package:dashboard_1/ui/views/users_view.dart';

import 'package:dashboard_1/router/router.dart';
import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:dashboard_1/providers/sidemenu_provider.dart';

import 'package:dashboard_1/ui/views/login_view.dart';
import 'package:dashboard_1/ui/views/dashboard_view.dart';
import 'package:dashboard_1/ui/views/icons_view.dart';
import 'package:dashboard_1/ui/views/blank_view.dart';

class DashboardHandlers {
  // Dashboard
  static Handler dashboard = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dasboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  // Icons
  static Handler icons = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  // Blank
  static Handler blank = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });

  // Categories
  static Handler categories = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return CategoriesView();
    else
      return LoginView();
  });

  // Users
  static Handler users = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usersRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return UsersView();
    else
      return LoginView();
  });

  // User
  static Handler user = new Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (parameters['uid']?.first != null) {
        return UserView(uid: parameters['uid']!.first);
      }
    } else {
      return LoginView();
    }
  });
}
