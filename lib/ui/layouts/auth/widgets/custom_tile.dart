import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'logo.png',
            color: Colors.white,
            width: 50,
            height: 50,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text('JUST DO IT.',
                style: GoogleFonts.francoisOne(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      ),
    );
  }
}
