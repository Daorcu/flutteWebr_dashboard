import 'package:flutter/material.dart';

import 'package:dashboard_1/ui/layouts/auth/widgets/links_bar.dart';
import 'package:dashboard_1/ui/layouts/auth/widgets/custom_tile.dart';
import 'package:dashboard_1/ui/layouts/auth/widgets/custom_background.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        (size.width > 1050)
            ? _DesktopBody(child: child)
            : _MobileBody(child: child),

        // LinksBar
        LinksBar(),
      ],
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTile(),
          Container(
            color: Colors.deepOrange[600],
            width: double.infinity,
            height: 420,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: Column(
              children: [
                CustomBackground(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.deepOrange[600],
      child: Row(
        children: [
          // Fondo
          CustomBackground(),

          // Formulario
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.deepOrange[600],
            child: Column(
              children: [
                SizedBox(height: 30),
                CustomTile(),
                SizedBox(height: 50),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
