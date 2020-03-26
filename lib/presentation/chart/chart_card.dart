import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ChartCard extends StatelessWidget {
  ChartCard({
    @required this.chartBuilder,
    @required this.title,
  })  : assert(chartBuilder != null),
        assert(title != null);

  final Widget chartBuilder;
  final String title;

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
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
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
