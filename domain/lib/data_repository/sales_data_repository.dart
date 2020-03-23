import 'package:domain/models/sales_data.dart';

abstract class SalesDataRepository {

  Future<List<SalesData>> getSalesDataList();

}