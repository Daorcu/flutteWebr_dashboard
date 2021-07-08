import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: buildBoxDecoration(),
            child: Container(
                color: Colors.black45,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 180),
                    child: Image(
                      image: AssetImage('logo.png'),
                      width: 400,
                    ),
                  ),
                ))));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('fondo.jpg'),
        fit: BoxFit.cover,
      ),
      color: Colors.pink,
    );
  }
}
