import 'package:domain/models/grades_data.dart';

abstract class GradesDataRepository {

  Future<List<GradesData>> getGradesDataList();

}