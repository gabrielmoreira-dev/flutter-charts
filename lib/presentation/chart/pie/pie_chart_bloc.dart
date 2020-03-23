import 'package:charts_flutter/flutter.dart' as charts;
import 'package:domain/use_case/get_grades_data_uc.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/chart/pie/pie_chart_models.dart';
import 'package:rxdart/rxdart.dart';

import 'pie_chart_mappers.dart';

class PieChartBloc {
  PieChartBloc({
    @required this.gradesDataUC,
  }) : assert(gradesDataUC != null) {
    _subscriptions.add(
      _fetchGradesData().listen(_onNewStateSubject.add),
    );
  }

  final GetGradesDataUC gradesDataUC;

  final _subscriptions = CompositeSubscription();

  final _onNewStateSubject =
      BehaviorSubject<List<charts.Series<GradesDataVM, String>>>();

  Stream<List<charts.Series<GradesDataVM, String>>> get onNewState =>
      _onNewStateSubject;

  Stream<List<charts.Series<GradesDataVM, String>>> _fetchGradesData() async* {
    try {
      final gradesDataList = await gradesDataUC.getFuture();
      final dataVM = gradesDataList.map((data) => data.toVM()).toList();
      List<charts.Series<GradesDataVM, String>> series = [
        charts.Series(
          id: 'Grades',
          data: dataVM,
          labelAccessorFn: (GradesDataVM row, _) =>
              '${row.gradeSymbol}: ${row.numberOfStudents}',
          domainFn: (GradesDataVM series, _) => series.gradeSymbol,
          measureFn: (GradesDataVM series, _) => series.numberOfStudents,
        )
      ];
      yield series;
    } catch (e) {
      yield <charts.Series<GradesDataVM, String>>[];
    }
  }

  void dispose() {
    _onNewStateSubject.close();
  }
}
