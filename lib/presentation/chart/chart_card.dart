import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartCard extends StatelessWidget {
  ChartCard({
    @required this.chartBuilder,
  }) : assert(chartBuilder != null);

  final Widget chartBuilder;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Population of U.S. over the years",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: chartBuilder,
                )
              ],
            ),
          ),
        ),
      );
}
