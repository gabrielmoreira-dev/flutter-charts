import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            elevation: 5.0,
            color: Theme.of(context).primaryColorLight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Population",
                    style: Theme.of(context).textTheme.subtitle,
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
        ),
      );
}
