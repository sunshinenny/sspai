import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XAppBar extends StatefulWidget implements PreferredSizeWidget {
  XAppBar({Key key, this.title, this.textStyle}) : super(key: key);
  String title;
  TextStyle textStyle;

  @override
  _XAppBarState createState() =>
      _XAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(30);
}

class _XAppBarState extends State<XAppBar> {
  @override
  void didChangeDependencies() {
    print("updateDependencies ${widget.title}");
  }

  @override
  void didUpdateWidget(XAppBar oldWidget) {
    print("updateWidget ${widget.title}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Text(
              "${widget.title}",
              style: widget.textStyle,
            )
          ],
        ),
      ),
    );
  }
}
