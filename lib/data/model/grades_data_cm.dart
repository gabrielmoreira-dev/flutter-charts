import 'package:flutter/widgets.dart';

class GradesDataCM {
  GradesDataCM({
    @required this.gradeSymbol,
    @required this.numberOfStudents,
  })  : assert(gradeSymbol != null),
        assert(numberOfStudents != null);

  final String gradeSymbol;
  final int numberOfStudents;
}
