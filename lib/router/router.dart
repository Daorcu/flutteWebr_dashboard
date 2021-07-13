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
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

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

    // Dashboard/icons
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);

    // Dashboard/blank
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
