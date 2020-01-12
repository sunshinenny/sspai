import 'package:flutter/material.dart';
import 'package:sspai/bean/homesub_entity.dart';
import 'package:sspai/util/path_convert.dart';
import 'package:sspai/util/screen_utils.dart';

class HomesubCard extends StatelessWidget {
  HomesubCard({Key key, this.data}) : super(key: key);

  final HomesubData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        child: Image.network(
          PathConvert.getWholeImagePath(data.image),
          width: ScreenUtils.screenW(context)*0.85,
        ),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
    );
  }
}
