import 'package:domain/models/grades_data.dart';
import 'package:fluttergraphs/presentation/chart/pie/pie_chart_models.dart';

extension PieChartMappers on GradesData {
  GradesDataVM toVM() => GradesDataVM(
        gradeSymbol: gradeSymbol,
        numberOfStudents: numberOfStudents,
      );
}
