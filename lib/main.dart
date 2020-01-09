import 'package:flutter/material.dart';
import 'package:sspai/page/article.dart';
import 'package:sspai/page/splash/splash_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '少数派',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashWidget(),
      routes: {
        "article_page": (context) => Article(),
      },
    );
  }
}
