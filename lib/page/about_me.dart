import 'package:flutter/material.dart';
import 'package:sspai/page/index.dart';
import 'package:sspai/widget/avatar_clipoval.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
              GestureDetector(
                child: InkWell(
                  child: Hero(
                    tag: "avatar",
                    child: AvatarClipoval(
                      path: "",
                      size: 88,
                    ),
                  ),
                ),
                onTap: () {
                  print('准备修改头像的页面');
                },
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
        ListView.builder(
          shrinkWrap: true,
          itemCount: _pageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Flex(
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
                              _pageList[index].title,
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
            );
          },
        )
      ],
    );
  }
}

class Pages {
  String title;
  Widget page;

  Pages(this.title, this.page);
}
