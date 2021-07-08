import 'package:dashboard_1/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        color: Colors.deepOrange[600],
        height: (size.width > 1000) ? size.height * 0.05 : null,
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              LinkText(text: 'Home'),
              LinkText(text: 'About'),
              LinkText(text: 'Privacy Policy'),
              LinkText(text: 'Blog'),
              LinkText(text: 'Brand'),
              LinkText(text: 'Help Center'),
              LinkText(text: 'Cookie Policy'),
              LinkText(text: 'Contact'),
            ],
          ),
        ));
  }
}
