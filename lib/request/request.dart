import 'dart:convert';

import 'package:dio/dio.dart';
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
}
