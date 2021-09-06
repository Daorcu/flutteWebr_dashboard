import 'package:flutter/material.dart';

import 'package:dashboard_1/api/cafe_api.dart';

import 'package:dashboard_1/models/http/auth_response.dart';

import 'package:dashboard_1/router/router.dart';

import 'package:dashboard_1/services/local_storage.dart';
import 'package:dashboard_1/services/navigation_service.dart';
import 'package:dashboard_1/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  //String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    CafeApi.post('/auth/login', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.navigateTo(Flurorouter.dasboardRoute);
      CafeApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationsService.showSnackbarError(
          'Los datos ingresados no son válidos');
    });

    // this._token = 'akjfrjnfcskr.ljsbdksbdg.oiserhfgbfdh';
    // LocalStorage.prefs.setString('token', this._token!);

    // authStatus = AuthStatus.authenticated;
    // notifyListeners();

    // NavigationService.navigateTo(Flurorouter.dasboardRoute);
  }

  register(String email, String password, String name) {
    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.navigateTo(Flurorouter.dasboardRoute);
      CafeApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationsService.showSnackbarError(
          'Los datos ingresados no son válidos');
    });
  }

  notifyListeners();

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);

      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
