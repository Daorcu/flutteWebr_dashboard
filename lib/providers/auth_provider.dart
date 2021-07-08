import 'package:dashboard_1/router/router.dart';
import 'package:dashboard_1/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_1/services/local_storage.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    // TODO: Peticion HTTP

    this._token = 'akjfrjnfcskr.ljsbdksbdg.oiserhfgbfdh';
    LocalStorage.prefs.setString('token', this._token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.navigateTo(Flurorouter.dasboardRoute);
  }

  notifyListeners();

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: Ir al back y comprobar si el JWT es válido

    await Future.delayed(Duration(seconds: 1));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
