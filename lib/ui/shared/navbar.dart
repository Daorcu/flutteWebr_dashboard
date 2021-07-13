import 'package:flutter/material.dart';

import 'package:dashboard_1/providers/sidemenu_provider.dart';

import 'package:dashboard_1/ui/shared/widgets/search_text.dart';
import 'package:dashboard_1/ui/shared/widgets/navbar_avatar.dart';
import 'package:dashboard_1/ui/shared/widgets/notifications_indicator.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            // Ícono de menú
            IconButton(
              icon: Icon(Icons.menu_outlined),
              onPressed: () => SideMenuProvider.openMenu(),
            ),
          SizedBox(width: 10),
          // Caja de búsqueda
          if (size.width > 450)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),
          Spacer(),
          NotificationsIndicador(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() =>
      BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
        )
      ]);
}
