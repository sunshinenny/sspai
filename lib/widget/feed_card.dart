import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:sspai/bean/feed_attribute.dart';
import 'package:sspai/util/date_utils.dart';
import 'package:sspai/widget/avatar_clipoval.dart';

// ignore: must_be_immutable
class FeedCard extends StatefulWidget {
  FeedCard({Key key, this.feedAttribute}) : super(key: key);

  FeedAttribute feedAttribute;

  @override
  State<StatefulWidget> createState() =>
      _FeedCardState(feedAttribute: feedAttribute);
}

class _FeedCardState extends State<FeedCard> {
  _FeedCardState({Key key, this.feedAttribute});

  FeedAttribute feedAttribute;

  double _left = 0.0; // 距左边的偏移

  @override
  Widget build(BuildContext context) {
    // 定义四周间距
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: DisplayCard(feedAttribute: feedAttribute),
    );
  }
}

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    Key key,
    @required this.feedAttribute,
  }) : super(key: key);

  final FeedAttribute feedAttribute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconNameAndOptions(
          avatar: feedAttribute.avatar,
          nickname: feedAttribute.nickname,
          id: feedAttribute.id,
        ),
        GestureDetector(
          child: Column(
            children: <Widget>[
              Hero(child: ImageFromWeb(banner: feedAttribute.banner), tag: "feed_banner_${feedAttribute.banner}",),
              TextTitleAndBody(
                title: feedAttribute.title,
                summary: feedAttribute.summary,
              ),
            ],
          ),
          onTap: () => {
            Navigator.of(context)
                .pushNamed("article_page", arguments: feedAttribute)
          },
        ),
        BottomInfo(
          like_count: feedAttribute.likeCount,
          comment_count: feedAttribute.commentCount,
          released_time: feedAttribute.releasedTime,
        ),
      ],
    );
  }
}

/// 用户头像、用户名和操作项
// ignore: must_be_immutable
class IconNameAndOptions extends StatelessWidget {
  IconNameAndOptions({Key key, this.avatar, this.nickname, this.id})
      : super(key: key);

  String avatar;
  String nickname;
  int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: <Widget>[
            GestureDetector(
              child: AvatarClipoval(
                path: avatar,
                size: 36,
              ),
              onTap: () => {
                //打开B路由
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("原图"),
                      ),
                      body: Container(),
                    ),
                  );
                }))
              },
            ),
            Text(
              "$nickname",
              style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode(context) ? Colors.white : Colors.black54),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: <Widget>[
            GestureDetector(
                child: Text(
                  "···",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: isDarkMode(context) ? Colors.white : Colors.black26,
                  ),
                ),
                onTap: () {
                  Share.share("https://sspai.com/post/$id");
                }),
          ],
        )
      ],
    );
  }
}

/*
测试组件
 */
class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //    print(ScreenUtils.screenH(context));
    return BottomSheet(
      builder: (BuildContext context) {
        return Container(height: 300, color: Colors.red);
      },
      onClosing: () {},
    );
  }
}

/// 文章标题以及文章简介部分
// ignore: must_be_immutable
class TextTitleAndBody extends StatelessWidget {
  TextTitleAndBody({Key key, this.title, this.summary}) : super(key: key);

  String title;
  String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "$title",
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "$summary",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                color: isDarkMode(context) ? Colors.white : Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}

/// 从少数派读取的图片
// ignore: must_be_immutable
class ImageFromWeb extends StatelessWidget {
  ImageFromWeb({Key key, this.banner}) : super(key: key);

  String banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              width: 450,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              "https://cdn.sspai.com/$banner?imageMogr2/quality/95/thumbnail/!1200x400r/gravity/Center/crop/1200x400/interlace/1",
              width: 450,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
    //                    "https://cdn.sspai.com/article/55806f27-a137-0fb3-1248-0bffd08a773c.jpg?imageMogr2/quality/95/thumbnail/!456x456r/gravity/Center/crop/456x456/interlace/1",
  }
}

/// 底部点赞等信息展示栏
// ignore: must_be_immutable
class BottomInfo extends StatelessWidget {
  // ignore: non_constant_identifier_names
  BottomInfo({Key key, this.like_count, this.comment_count, this.released_time})
      : super(key: key);

  // ignore: non_constant_identifier_names
  int like_count;

  // ignore: non_constant_identifier_names
  int comment_count;

  // ignore: non_constant_identifier_names
  int released_time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                // 纵向对齐方式
                spacing: 8,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color:
                        isDarkMode(context) ? Colors.white : Colors.grey[400],
                    size: 15,
                  ),
                  Text(
                    "$like_count · $comment_count 评论",
                    style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode(context)
                            ? Colors.white
                            : Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Icon(Icons.sync,
                  color: isDarkMode(context) ? Colors.white : Colors.grey[500],
                  size: 15),
              Text(
                " ${DateUtils.getHowLongAgo(released_time * 1000)}推荐",
                style: TextStyle(
                    fontSize: 15,
                    color:
                        isDarkMode(context) ? Colors.white : Colors.grey[600]),
              )
            ],
          )
        ],
      ),
    );
  }
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
