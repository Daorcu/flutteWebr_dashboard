import 'package:flutter/material.dart';

import 'package:dashboard_1/ui/cards/white_card.dart';
import 'package:dashboard_1/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons View', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'Icono 1',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 2',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 3',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 4',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 5',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 6',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 7',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 8',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 9',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
              WhiteCard(
                title: 'Icono 10',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                width: 170,
              ),
            ],
          )
        ],
      ),
    );
  }
}
