import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/common/response_view/error_view.dart';
import 'package:fluttergraphs/presentation/common/response_view/loading_view.dart';

class ResponseView<Loading, Error, Success> extends StatelessWidget {
  ResponseView({
    @required this.snapshot,
    @required this.builder,
  })  : assert(snapshot != null),
        assert(builder != null),
        assert(Loading != dynamic),
        assert(Error != dynamic),
        assert(Success != dynamic);

  final AsyncSnapshot snapshot;
  final Widget Function(BuildContext context, Success success) builder;

  @override
  Widget build(BuildContext context) {
    if(snapshot.data == null || snapshot.data is Loading){
      return LoadingView();
    }
    else if(snapshot.data is Error){
      return ErrorView();
    }
    else if(snapshot.data is Success){
      return builder(context, snapshot.data);
    }
    throw Exception();
  }
}
