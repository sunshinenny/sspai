import 'package:flutter/material.dart';
import 'package:sspai/bean/pay_entity.dart';
import 'package:sspai/util/path_convert.dart';

class PayCard extends StatefulWidget {
  PayCard({Key key, this.payData}) : super(key: key);
  final PayData payData;

  @override
  _PayCardState createState() => _PayCardState(payData: payData);
}

class _PayCardState extends State<PayCard> with SingleTickerProviderStateMixin {
  _PayCardState({Key key, this.payData});

  AnimationController _controller;
  final PayData payData;
  var _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    // 定义动画
    _animation = Tween<double>(begin: 1, end: 0.965).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScaleTransition(
        child: GestureDetector(
          child: ClipRRect(
            child: Image.network(
              PathConvert.getWholeImagePath(payData.banner),
              width: 200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          onPanDown: (details) {
            print('onPanDown');
            _controller.forward(); // 点击的时候播放动画
          },
          onPanCancel: () {
            print('onPanCancel');
            _controller.reverse(); // cancel的时候回弹动画
          },
        ),
        scale: _animation,
      ),
    );
  }
}
