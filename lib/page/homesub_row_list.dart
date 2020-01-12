import 'package:flutter/material.dart';
import 'package:sspai/request/request.dart';
import 'package:sspai/widget/homesub_card.dart';

class HomesubRowList extends StatefulWidget {
  @override
  _HomesubRowListState createState() => _HomesubRowListState();
}

class _HomesubRowListState extends State<HomesubRowList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    animation = Tween<double>(begin: 1, end: 0.95).animate(_controller);
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: FutureBuilder(
        future: Request.getHomeSub(4, 0),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomesubCard(
                    data: snapshot.data.data[index],
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
