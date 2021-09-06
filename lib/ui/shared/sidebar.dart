import 'package:dashboard_1/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_1/services/navigation_service.dart';

import 'package:dashboard_1/router/router.dart';
import 'package:dashboard_1/providers/sidemenu_provider.dart';

import 'package:dashboard_1/ui/shared/widgets/logo.dart';
import 'package:dashboard_1/ui/shared/widgets/menu_item.dart';
import 'package:dashboard_1/ui/shared/widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'Main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.dasboardRoute,
            onPressed: () => navigateTo(Flurorouter.dasboardRoute),
          ),
          MenuItem(
            text: 'Orders',
            icon: Icons.shopping_cart_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Analytics',
            icon: Icons.show_chart_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Categories',
            icon: Icons.layers_outlined,
            isActive:
                sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
            onPressed: () => navigateTo(Flurorouter.categoriesRoute),
          ),
          MenuItem(
            text: 'Products',
            icon: Icons.dashboard_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Discount',
            icon: Icons.attach_money_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Consumers',
            icon: Icons.people_alt_outlined,
            onPressed: () => print('Dashboard'),
          ),
          SizedBox(height: 30),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            onPressed: () => print('Dashboard'),
          ),
          MenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
          ),
          SizedBox(height: 50),
          TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   Color(0xfff4511e),
          //   Color(0xfff4511e),
          // ]),
          color: Color(0xfff4511e),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset.fromDirection(3)),
          ]);
}
