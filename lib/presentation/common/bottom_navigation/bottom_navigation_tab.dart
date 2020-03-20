import 'package:flutter/widgets.dart';

class BottomNavigationTab {
  BottomNavigationTab({
    @required this.item,
    @required this.key,
    @required this.initialPageBuilder,
  })  : assert(item != null),
        assert(key != null),
        assert(initialPageBuilder != null);

  final BottomNavigationBarItem item;
  final GlobalKey<NavigatorState> key;
  final WidgetBuilder initialPageBuilder;
}
