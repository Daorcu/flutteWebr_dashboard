import 'package:flutter/material.dart';

import 'package:dashboard_1/ui/cards/white_card.dart';
import 'package:dashboard_1/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Sales...',
            child: Text('Text'),
          )
        ],
      ),
    );
  }
}
