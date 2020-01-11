import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sspai/bean/comment_entity.dart';
import 'package:sspai/util/date_utils.dart';
import 'package:sspai/util/path_convert.dart';

class CommentCard extends StatefulWidget {
  CommentCard({Key key, this.commentData}) : super(key: key);
  final CommentData commentData;

  @override
  _CommentCardState createState() =>
      _CommentCardState(commentData: commentData);
}

class _CommentCardState extends State<CommentCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  _CommentCardState({Key key, this.commentData});

  final CommentData commentData;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MainCard(commentData: commentData),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key key,
    @required this.commentData,
  }) : super(key: key);

  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            width: 36,
                          ),
                        ),
                        BuildAvatarWidget(path: commentData.user.avatar),
                      ],
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 12,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "${commentData.user.nickname}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Text(
                        "···",
                        style: TextStyle(fontSize: 40, color: Colors.grey[350]),
                      ),
                      onTap: () => {},
                    )
                  ],
                ),
                // 评论内容
                Align(
                    alignment: Alignment.centerLeft,
                    child: Html(
                      data: commentData.comment,
                      defaultTextStyle: TextStyle(fontSize: 16),
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      "${DateUtils.getHowLongAgo(commentData.createdAt * 1000)}",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 20,
                        ),
                        onPressed: null),
                    IconButton(
                      icon: Icon(
                        Icons.comment,
                        size: 20,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Divider(
                  thickness: 1.5,
                ),
                ReplayCard(
                  commentData: commentData,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReplayCard extends StatelessWidget {
  const ReplayCard({Key key, @required this.commentData}) : super(key: key);

  final CommentData commentData;

  Widget buildList() {
    List<Widget> cardList = [];
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in commentData.reply) {
      cardList.add(ChildCommentCard(
        commantDataReply: item,
      ));
    }
    content = new Column(
        children: cardList //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
        );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        commentData.reply.length > 0 ? buildList() : Container()
      ],
    );
  }
}

class ChildCommentCard extends StatelessWidget {
  const ChildCommentCard(
      {Key key, @required this.commantDataReply, this.parentNickname})
      : super(key: key);

  final parentNickname;

  final CommantDataReply commantDataReply;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipOval(
                            child: Container(
                              width: 36,
                            ),
                          ),
                          ClipOval(
                              child: Container(
                            width: 36,
                            child: BuildAvatarWidget(
                                path: commantDataReply.author.avatar),
                          )),
                        ],
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 12,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${getReplayAuthorText()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Text(
                          "···",
                          style:
                              TextStyle(fontSize: 30, color: Colors.grey[350]),
                        ),
                        onTap: () => {},
                      )
                    ],
                  ),
                  // 评论内容
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Html(
                        data: commantDataReply.comment,
                        defaultTextStyle: TextStyle(fontSize: 16),
                      )),
                  Row(
                    children: <Widget>[
                      Text(
                        "${DateUtils.getHowLongAgo(commantDataReply.createdAt * 1000)}",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            size: 20,
                          ),
                          onPressed: null),
                      IconButton(
                        icon: Icon(
                          Icons.comment,
                          size: 20,
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }

  String getReplayAuthorText() {
    if (commantDataReply.author.nickname == "") {
      return commantDataReply.user.nickname;
    } else {
      return "${commantDataReply.user.nickname} 回复 ${commantDataReply.author.nickname}";
    }
  }
}

class BuildAvatarWidget extends StatelessWidget {
  const BuildAvatarWidget({
    Key key,
    @required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(width: 36, child: _build()),
    );
  }

  Widget _build() {
    try {
      //            return Image.network("${PathConvert.getWholeImagePath(path)}");
      return Container();
    } catch (e) {
      print('图片加载失败 => ${PathConvert.getWholeImagePath(path)}');
      return Container();
    }
  }
}
