import 'package:flutter/material.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/feed_card.dart';

class Skeleton extends StatefulWidget {
  Skeleton({Key key}) : super(key: key);

  @override
  _SkeletonState createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matrix"),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return FeedCard(
                  matrixData: snapshot.data.data[index],
                );
              },
            );
          } else {
            return LinearProgressIndicator();
          }
        },
        future: Request.getMatrixFuture(20, 0),
      ),
    );
  }
}
