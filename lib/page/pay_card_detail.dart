import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sspai/bean/pay_entity.dart';
import 'package:sspai/util/path_convert.dart';
import 'package:sspai/util/screen_utils.dart';
import 'dart:ui' as ui;

import 'package:sspai/widget/avatar_clipoval.dart';

class PayCardDetail extends StatefulWidget {
  @override
  _PayCardDetailState createState() => _PayCardDetailState();
}

class _PayCardDetailState extends State<PayCardDetail>
    with SingleTickerProviderStateMixin {
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
    PayData payData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(payData.title),
        //        leading: IconButton(
        //          icon: Icon(CupertinoIcons.back),
        //          onPressed: () {
        //            Navigator.pop(context);
        //          },
        //        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            Hero(
              tag: "banner${payData.title}",
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: .7, //宽度设为原来宽度一半
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                PathConvert.getWholeImagePath(payData.banner),
                              ),
                              BackdropFilter(
                                filter: ui.ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 20,
                                ),
                                child: Container(
                                  color: Colors.white.withOpacity(0.1),
                                  width: MediaQuery.of(context).size.width,
                                  height: 450,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                PathConvert.getWholeImagePath(payData.banner),
                                width: ScreenUtils.screenW(context) * 0.75,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "售价：${payData.fee ~/ 100}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: ScreenUtils.screenH(context) * 0.02,
                    endIndent: ScreenUtils.screenH(context) * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("作者简介:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            children: <Widget>[
                              AvatarClipoval(path: payData.avatar, size: 50),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  payData.nickname,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
