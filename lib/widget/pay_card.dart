import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sspai/bean/pay_entity.dart';
import 'package:sspai/util/path_convert.dart';

class PayCard extends StatelessWidget {
  PayCard({Key key, this.payData}) : super(key: key);
  final PayData payData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(PathConvert.getWholeImagePath(payData.banner),width: 200,),
        )
      ],
    );
  }
}
