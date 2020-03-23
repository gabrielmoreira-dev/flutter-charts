import 'package:domain/models/sales_data.dart';
import 'package:fluttergraphs/presentation/chart/line/line_chart_models.dart';

extension LineChartMappers on SalesData {
  SalesDataVM toVM() => SalesDataVM(
        year: year,
        sales: sales,
      );
}
