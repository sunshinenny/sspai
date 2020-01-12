import 'package:sspai/generated/json/base/json_convert_content.dart';
import 'package:sspai/generated/json/base/json_filed.dart';

class PayEntity with JsonConvert<PayEntity> {
  int error;
  List<PayData> data;
  int total;
}

class PayData with JsonConvert<PayData> {
  int id;
  String banner;
  String nickname;
  int stime;
  @JSONField(name: "is_end")
  bool isEnd;
  @JSONField(name: "article_total")
  int articleTotal;
  @JSONField(name: "update_total")
  int updateTotal;
  @JSONField(name: "is_discount")
  bool isDiscount;
  double discount;
  String avatar;
  String summary;
  String title;
  @JSONField(name: "released_at")
  int releasedAt;
  int fee;
  @JSONField(name: "user_id")
  int userId;
  @JSONField(name: "discount_stime")
  int discountStime;
  @JSONField(name: "discount_etime")
  int discountEtime;
  @JSONField(name: "sell_status")
  bool sellStatus;
}
