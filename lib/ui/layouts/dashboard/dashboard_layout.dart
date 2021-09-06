import 'package:dashboard_1/providers/sidemenu_provider.dart';
import 'package:dashboard_1/ui/shared/navbar.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_1/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              // Barra lateral
              if (size.width >= 700) SideBar(),

              // Barra de navegación y View
              Expanded(
                child: Column(
                  children: [
                    // Navbar
                    Navbar(),

                    // View
                    Expanded(
                      child: Container(
                        // child:
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  if (SideMenuProvider.isOpen)
                    Opacity(
                      opacity: SideMenuProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () => SideMenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0),
                    child: SideBar(),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
