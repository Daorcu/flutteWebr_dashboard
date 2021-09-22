import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_1/api/cafe_api.dart';

import 'package:dashboard_1/router/router.dart';

import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:dashboard_1/providers/users_provider.dart';
import 'package:dashboard_1/providers/sidemenu_provider.dart';
import 'package:dashboard_1/providers/user_form_provider.dart';
import 'package:dashboard_1/providers/categories_provider.dart';

import 'package:dashboard_1/services/local_storage.dart';
import 'package:dashboard_1/services/navigation_service.dart';
import 'package:dashboard_1/services/notifications_service.dart';

import 'package:dashboard_1/ui/layouts/auth/auth_layout.dart';
import 'package:dashboard_1/ui/layouts/splash/splash_layout.dart';
import 'package:dashboard_1/ui/layouts/dashboard/dashboard_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Admin Dashboard',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        // builder: (_, child) => AuthLayout(child: child!),
        builder: (context, child) {
          final authProvider = Provider.of<AuthProvider>(context);

          if (authProvider.authStatus == AuthStatus.checking)
            return SplashLayout();
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return AuthLayout(child: child!);
          }
        });
  }
}
