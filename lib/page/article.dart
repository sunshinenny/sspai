import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sspai/bean/feed_attribute.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/util/date_utils.dart';

class Article extends StatefulWidget {
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> with SingleTickerProviderStateMixin {
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
    FeedAttribute feedAttribute = ModalRoute.of(context).settings.arguments;
    print(feedAttribute.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("comment_page", arguments: feedAttribute.id);
                },
              ),
              Text('${feedAttribute.commentCount}'),
              IconButton(
                icon: Icon(Icons.flash_on),
                onPressed: () {},
              ),
              Text('${feedAttribute.likeCount}'),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                  "https://cdn.sspai.com/${feedAttribute.banner}?imageMogr2/quality/95/thumbnail/!1200x400r/gravity/Center/crop/1200x400/interlace/1"),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    feedAttribute.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateUtils.getYYYYMMDD(feedAttribute.releasedTime),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 18,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      ClipOval(
                          child: Image.network(
                        "https://cdn.sspai.com/${feedAttribute.avatar}",
                        width: 32,
                      )),
                      Text(
                        feedAttribute.nickname,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FutureBuilder(
                      future: Request.getArticleContext(feedAttribute.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Html(
                              data: snapshot.data,
                              linkStyle: const TextStyle(
                                  color: Colors.redAccent,
                                  textBaseline: TextBaseline.ideographic),
                              defaultTextStyle: TextStyle(fontSize: 18));
                        } else {
                          return LinearProgressIndicator();
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
