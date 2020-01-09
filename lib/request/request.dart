import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;
import 'package:sspai/bean/index_entity.dart';
import 'package:sspai/bean/matrix_entity.dart';
import 'package:sspai/request/api.dart';

class Request {
  // ignore: missing_return
  static Future<MatrixEntity> getMatrixFuture(int count, int offset) async {
    try {
      Response response = await Dio().get(API.getMatrix(count, offset));
      return new MatrixEntity().fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  static Future<IndexEntity> getIndexFuture(int count, int offset) async {
    try {
      Response response = await Dio().get(API.getIndex(count, offset));
      return new IndexEntity().fromJson(json.decode(response.data));
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getArticleContext(int id) async {
    try {
      Response response = await Dio().get("https://sspai.com/post/$id");
      dom.Document document = parse(response.data);
      var querySelector = document.body.querySelector(
          '#app > div.postPage.article-wrapper > div.article-detail > article > div.article-body');
      return querySelector.innerHtml;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
