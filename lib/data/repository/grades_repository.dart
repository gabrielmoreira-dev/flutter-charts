import 'package:domain/data_repository/grades_data_repository.dart';
import 'package:domain/models/grades_data.dart';

class GradesRepository extends GradesDataRepository {
  @override
  Future<List<GradesData>> getGradesDataList() async => _gradesDataList;

  final _gradesDataList = [
    GradesData(
      gradeSymbol: 'A',
      numberOfStudents: 190,
    ),
    GradesData(
      gradeSymbol: 'B',
      numberOfStudents: 230,
    ),
    GradesData(
      gradeSymbol: 'C',
      numberOfStudents: 150,
    ),
    GradesData(
      gradeSymbol: 'D',
      numberOfStudents: 73,
    ),
    GradesData(
      gradeSymbol: 'E',
      numberOfStudents: 31,
    ),
    GradesData(
      gradeSymbol: 'Fail',
      numberOfStudents: 13,
    ),
  ];
}
