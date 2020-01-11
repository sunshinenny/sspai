import 'package:flutter/material.dart';
import 'package:sspai/util/path_convert.dart';

class AvatarClipoval extends StatelessWidget {
  const AvatarClipoval({Key key, @required this.path, @required this.size})
      : super(key: key);
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 为了保证图片未加载时候的显示效果
        ClipOval(
            child: Container(
          width: size,
        )),
        ClipOval(
          child: getImageFromNetwork(),
        ),
      ],
    );
  }

  Widget getImageFromNetwork() {
    try {
      //      print("${PathConvert.getWholeImagePath(path)}");
      return Image.network(
        "${PathConvert.getWholeImagePath(path)}",
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
      //      return Container();
    } catch (e) {
      print('图片加载失败 => ${PathConvert.getWholeImagePath(path)}');
      return Container();
    }
  }
}
