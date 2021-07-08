import 'package:fluro/fluro.dart';

import 'package:dashboard_1/router/admin_handlers.dart';
import 'package:dashboard_1/router/dashboard_handlers.dart';
import 'package:dashboard_1/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dasboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dasboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
