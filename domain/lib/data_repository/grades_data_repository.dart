import 'package:fluttergraphs/data/model/grades_data_cm.dart';

abstract class GradesDataRepository {

  Future<List<GradesDataCM>> getGradesDataList();

}