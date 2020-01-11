import 'package:flutter/material.dart';
import 'package:sspai/widget/avatar_clipoval.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<Flex> _pages;

  List _pageList = [
    Pages("个人主页", Container()),
    Pages("已购内容", Container()),
    Pages("我的优惠券", Container()),
    Pages("我的余额", Container()),
    Pages("我的收藏", Container()),
    Pages("反馈和帮助", Container()),
    Pages("设置", Container()),
  ];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    if (_pages == null) {
      _pages = _pageList
          .map((item) => Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black87),
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                        )
                      ],
                    ),
                  )
                ],
              ))
          .toList();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
          child: Row(
            children: <Widget>[
              AvatarClipoval(
                path: "",
                size: 88,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Text(
                      "SunShiennny",
                      style: TextStyle(fontSize: 26),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(
                      "查看和编辑个人资料",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    alignment: Alignment.centerLeft,
                  )
                ],
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: _pages,
          ),
        ),
      ],
    );
  }
}

class Pages {
  String title;
  Widget page;

  Pages(this.title, this.page);
}
