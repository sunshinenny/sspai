import 'package:flutter/material.dart';

class Matrix extends StatefulWidget {
  @override
  _MatrixState createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
