import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/login_view.dart';
import 'package:dashboard_1/ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = new Handler(
    handlerFunc: (context, parameters) => LoginView(),
  );

  static Handler register = new Handler(
    handlerFunc: (context, parameters) => RegisterView(),
  );
}
