import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_bloc.dart';

class LineChartPage extends StatelessWidget {
  final bloc = LineChartBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Sales over the years",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: bloc.onNewState,
                    builder: (context, snapshot) => snapshot.data != null
                        ? charts.LineChart(
                            snapshot.data,
                            animate: true,
                            animationDuration: Duration(seconds: 3),
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
