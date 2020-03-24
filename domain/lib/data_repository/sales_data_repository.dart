import 'package:fluttergraphs/data/model/sales_data_cm.dart';

abstract class SalesDataRepository {

  Future<List<SalesDataCM>> getSalesDataList();

}