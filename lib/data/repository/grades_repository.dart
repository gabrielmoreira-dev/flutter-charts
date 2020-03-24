import 'package:domain/data_repository/grades_data_repository.dart';
import 'package:fluttergraphs/data/model/grades_data_cm.dart';

class GradesRepository extends GradesDataRepository {
  @override
  Future<List<GradesDataCM>> getGradesDataList() async => _gradesDataList;

  final _gradesDataList = [
    GradesDataCM(
      gradeSymbol: 'A',
      numberOfStudents: 190,
    ),
    GradesDataCM(
      gradeSymbol: 'B',
      numberOfStudents: 230,
    ),
    GradesDataCM(
      gradeSymbol: 'C',
      numberOfStudents: 150,
    ),
    GradesDataCM(
      gradeSymbol: 'D',
      numberOfStudents: 73,
    ),
    GradesDataCM(
      gradeSymbol: 'E',
      numberOfStudents: 31,
    ),
    GradesDataCM(
      gradeSymbol: 'Fail',
      numberOfStudents: 13,
    ),
  ];
}
