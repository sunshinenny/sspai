import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sspai/bean/matrix_entity.dart';

class FeedCard extends StatelessWidget {
  FeedCard({Key key, this.matrixData}) : super(key: key);

  MatrixData matrixData;

  @override
  Widget build(BuildContext context) {
    // 定义四周间距
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        children: <Widget>[
          Flex(
            children: <Widget>[
              IconNameAndOptions(
                avatar: matrixData.author.avatar,
                nickname: matrixData.author.nickname,
              ),
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    ImageFromSspai(banner: matrixData.banner),
                    TextTitleAndBody(
                      title: matrixData.title,
                      summary: matrixData.summary,
                    ),
                  ],
                ),
                onTap: () => {
                  //                  Navigator.of(context)
                  //                      .pushNamed("article_datail", arguments: matrixData)
                },
              ),
              ButtomInfo(
                like_count: matrixData.likeCount,
                comment_count: matrixData.commentCount,
                released_time: matrixData.releasedTime,
              )
            ],
            direction: Axis.vertical,
          ),
        ],
      ),
    );
  }
}

/// 用户头像、用户名和操作项
class IconNameAndOptions extends StatelessWidget {
  IconNameAndOptions({Key key, this.avatar, this.nickname}) : super(key: key);

  String avatar;
  String nickname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: <Widget>[
            GestureDetector(
              child: ClipOval(
                  child: Image.network(
                "https://cdn.sspai.com/${avatar}",
                width: 40,
              )),
              onTap: () => {print("Show User Home Page")},
            ),
            Text(
              "${nickname}",
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
                print("Show Options");
              },
            ),
          ],
        )
      ],
    );
  }
}

/// 文章标题以及文章简介部分
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
            "${title}",
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${summary}",
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
class ImageFromSspai extends StatelessWidget {
  ImageFromSspai({Key key, this.banner}) : super(key: key);

  String banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Image.network(
          "https://cdn.sspai.com/${banner}?imageMogr2/quality/95/thumbnail/!1200x400r/gravity/Center/crop/1200x400/interlace/1",
        ),
      ),
    );
    //                    "https://cdn.sspai.com/article/55806f27-a137-0fb3-1248-0bffd08a773c.jpg?imageMogr2/quality/95/thumbnail/!456x456r/gravity/Center/crop/456x456/interlace/1",
  }
}

/// 底部点赞等信息展示栏
class ButtomInfo extends StatelessWidget {
  ButtomInfo({Key key, this.like_count, this.comment_count, this.released_time})
      : super(key: key);

  int like_count;
  int comment_count;
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
                    "${like_count} · ${comment_count} 评论",
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
                " ${getHowLongAgo(released_time)}前推荐",
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

String getHowLongAgo(int timestamp) {
  int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
  int d = (nowTimestamp - timestamp * 1000) ~/ (3600 * 1000);
  String msg = d >= 24 ? "${d ~/ 24} 天" : "$d 小时";
  return msg;
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
