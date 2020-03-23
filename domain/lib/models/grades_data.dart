import 'package:flutter/widgets.dart';

class GradesData {
  GradesData({
    @required this.gradeSymbol,
    @required this.numberOfStudents,
  })  : assert(gradeSymbol != null),
        assert(numberOfStudents != null);

  final String gradeSymbol;
  final int numberOfStudents;
}
