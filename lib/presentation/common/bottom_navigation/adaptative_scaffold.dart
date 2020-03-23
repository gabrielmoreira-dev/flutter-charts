import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/bottom_navigation_tab.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/cupertino_scaffold.dart';
import 'package:fluttergraphs/presentation/common/bottom_navigation/material_scaffold.dart';

class AdaptativeScaffold extends StatefulWidget {
  AdaptativeScaffold({
    @required this.tabList,
  }) : assert(tabList != null);

  final List<BottomNavigationTab> tabList;

  @override
  _AdaptativeScaffoldState createState() => _AdaptativeScaffoldState();
}

class _AdaptativeScaffoldState extends State<AdaptativeScaffold> {
  var _selectedIndex = 1;

  Widget _buildMaterial() => MaterialScaffold(
    selectedIndex: _selectedIndex,
    tabList: widget.tabList,
    onItemSelected: _onItemSelected,
  );

  Widget _buildCupertino() => CupertinoScaffold(
    selectedIndex: _selectedIndex,
    tabList: widget.tabList,
    onItemSelected: _onItemSelected,
  );

  void _onItemSelected(int index) {
    if (_selectedIndex == index) {
      widget.tabList[index].key.currentState.popUntil((route) => route.isFirst);
    }
    Platform.isAndroid
        ? setState(() => _selectedIndex = index)
        : _selectedIndex = index;
  }

  Future<bool> _onWillPop() async {
    final maybePop = await widget.tabList[_selectedIndex].key.currentState
        .maybePop();
    return !maybePop;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Platform.isAndroid ? _buildMaterial() : _buildCupertino(),
    );
  }
}
