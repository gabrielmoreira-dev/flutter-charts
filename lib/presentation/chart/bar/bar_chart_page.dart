import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/bar/bar_chart_bloc.dart';

class BarChartPage extends StatelessWidget {
  final bloc = BarChartBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
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
                  child: StreamBuilder(
                    stream: bloc.onNewState,
                    builder: (context, snapshot) => snapshot.data != null
                        ? charts.BarChart(
                            snapshot.data,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            domainAxis: charts.OrdinalAxisSpec(
                              renderSpec: charts.SmallTickRendererSpec(
                                labelRotation: 60,
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
