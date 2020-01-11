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
      padding: const EdgeInsets.all(20.0),
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
                ReplayCard(commentData: commentData)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReplayCard extends StatelessWidget {
  const ReplayCard({
    Key key,
    @required this.commentData,
  }) : super(key: key);

  final CommentData commentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        commentData.reply.length > 0
            ? ListView.builder(
                shrinkWrap: true, // 使用子控件的总长度来设置ListView的长度（这里的长度为高度）
                itemCount: commentData.reply.length,
                itemBuilder: (BuildContext context, int index) {
                  return Flex(
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
                                          path: commentData
                                              .reply[index].author.avatar),
                                    )),
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
                                  "${commentData.reply[index].author.nickname}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Spacer(),
                                GestureDetector(
                                  child: Text(
                                    "···",
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.grey[350]),
                                  ),
                                  onTap: () => {},
                                )
                              ],
                            ),
                            // 评论内容
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Html(
                                  data: commentData.reply[index].comment,
                                  defaultTextStyle: TextStyle(fontSize: 16),
                                )),
                            Row(
                              children: <Widget>[
                                Text(
                                  "${DateUtils.getHowLongAgo(commentData.reply[index].createdAt * 1000)}",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
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
                          ],
                        ),
                      )
                    ],
                  );
                },
              )
            : Text("No Replay")
      ],
    );
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
      //      return Image.network("${PathConvert.getWholeImagePath(path)}");
      return Container();
    } catch (e) {
      print('图片加载失败 => ${PathConvert.getWholeImagePath(path)}');
      return Container();
    }
  }
}
