import 'package:flutter/widgets.dart';

class GradesDataVM {
  GradesDataVM({
    @required this.gradeSymbol,
    @required this.numberOfStudents,
  })  : assert(gradeSymbol != null),
        assert(numberOfStudents != null);

  final String gradeSymbol;
  final int numberOfStudents;
}
