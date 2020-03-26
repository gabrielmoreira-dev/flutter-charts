import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GraphsAppBar extends StatelessWidget implements PreferredSizeWidget {
  GraphsAppBar({
    @required this.title,
  }) : assert(title != null);

  final String title;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      );

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
