import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = new Handler(
    handlerFunc: (context, parameters) => NoPageFoundView(),
  );
}
