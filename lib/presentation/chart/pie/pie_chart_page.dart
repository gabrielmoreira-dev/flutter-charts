import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_grades_data_uc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/pie/pie_chart_bloc.dart';
import 'package:provider/provider.dart';

class PieChartPage extends StatelessWidget {
  PieChartPage({
    @required this.bloc,
  }) : assert(bloc != null);

  final PieChartBloc bloc;

  static Widget create(BuildContext context) =>
      ProxyProvider<GetGradesDataUC, PieChartBloc>(
        update: (_, uc, currentBloc) =>
            currentBloc ??
            PieChartBloc(
              gradesDataUC: uc,
            ),
        child: Consumer<PieChartBloc>(
          builder: (_, bloc, __) => PieChartPage(
            bloc: bloc,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Grades of the students in the calendar year",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: bloc.onNewState,
                    builder: (context, snapshot) => snapshot.data != null
                        ? charts.PieChart(
                            snapshot.data,
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 60,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator(),
                              ],
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
