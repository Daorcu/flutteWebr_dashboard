import 'package:dashboard_1/providers/sidemenu_provider.dart';
import 'package:fluro/fluro.dart';

import 'package:dashboard_1/ui/views/no_page_found_view.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = new Handler(handlerFunc: (context, parameters) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');
    return NoPageFoundView();
  });
}
