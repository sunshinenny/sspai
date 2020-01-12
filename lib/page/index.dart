import 'package:flutter/material.dart';
import 'package:sspai/bean/feed_attribute.dart';
import 'package:sspai/page/pay_row_list.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/feed_card.dart';

import 'homesub_row_list.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
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
              shrinkWrap: true,
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return HomesubRowList();
                }
                if (index == 2) {
                  return PayRowList();
                }
                return FeedCard(
                    feedAttribute: new FeedAttribute(
                        snapshot.data.data[index].id,
                        snapshot.data.data[index].title,
                        snapshot.data.data[index].author.avatar
                            .replaceAll("https://cdn.sspai.com", ""),
                        snapshot.data.data[index].author.nickname,
                        snapshot.data.data[index].likeTotal,
                        snapshot.data.data[index].commentTotal,
                        snapshot.data.data[index].releasedAt,
                        snapshot.data.data[index].banner
                            .replaceAll("https://cdn.sspai.com", ""),
                        snapshot.data.data[index].summary));
              });
        } else {
          return LinearProgressIndicator();
        }
      },
      future: Request.getIndexFuture(20, 0),
    );
  }
}
