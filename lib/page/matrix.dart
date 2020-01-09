import 'package:flutter/material.dart';
import 'package:sspai/bean/feed_attribute.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/feed_card.dart';

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
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (BuildContext context, int index) {
              return FeedCard(
                  feedAttribute: new FeedAttribute(
                      snapshot.data.data[index].id,
                      snapshot.data.data[index].title,
                      snapshot.data.data[index].author.avatar,
                      snapshot.data.data[index].author.nickname,
                      snapshot.data.data[index].likeCount,
                      snapshot.data.data[index].commentCount,
                      snapshot.data.data[index].releasedTime,
                      snapshot.data.data[index].banner,
                      snapshot.data.data[index].summary));
            },
          );
        } else {
          return LinearProgressIndicator();
        }
      },
      future: Request.getMatrixFuture(20, 0),
    );
  }
}
