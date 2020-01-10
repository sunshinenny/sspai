import 'package:flutter/material.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/comment_card.dart';

class Comment extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    print("In comment");
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
    return Scaffold(
      appBar: AppBar(
        title: Text("评论"),
      ),
      body: FutureBuilder(
        future: Request.getCommentFuture(
            999, 0, ModalRoute.of(context).settings.arguments),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CommentCard(commentData: snapshot.data.data[index]);
              },
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
