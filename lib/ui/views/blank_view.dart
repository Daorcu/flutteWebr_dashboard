import 'package:flutter/material.dart';

import 'package:dashboard_1/ui/cards/white_card.dart';
import 'package:dashboard_1/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Blank Page...',
            child: Text('Text...'),
          )
        ],
      ),
    );
  }
}
