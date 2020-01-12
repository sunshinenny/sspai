import 'package:sspai/bean/pay_entity.dart';
import 'package:sspai/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

payEntityFromJson(PayEntity data, Map<String, dynamic> json) {
	data.error = json['error']?.toInt();
	if (json['data'] != null) {
		data.data = new List<PayData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new PayData().fromJson(v));
		});
	}
	data.total = json['total']?.toInt();
	return data;
}

Map<String, dynamic> payEntityToJson(PayEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	return data;
}

payDataFromJson(PayData data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.banner = json['banner']?.toString();
	data.nickname = json['nickname']?.toString();
	data.stime = json['stime']?.toInt();
	data.isEnd = json['is_end'];
	data.articleTotal = json['article_total']?.toInt();
	data.updateTotal = json['update_total']?.toInt();
	data.isDiscount = json['is_discount'];
	data.discount = json['discount']?.toDouble();
	data.avatar = json['avatar']?.toString();
	data.summary = json['summary']?.toString();
	data.title = json['title']?.toString();
	data.releasedAt = json['released_at']?.toInt();
	data.fee = json['fee']?.toInt();
	data.userId = json['user_id']?.toInt();
	data.discountStime = json['discount_stime']?.toInt();
	data.discountEtime = json['discount_etime']?.toInt();
	data.sellStatus = json['sell_status'];
	return data;
}

Map<String, dynamic> payDataToJson(PayData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['banner'] = entity.banner;
	data['nickname'] = entity.nickname;
	data['stime'] = entity.stime;
	data['is_end'] = entity.isEnd;
	data['article_total'] = entity.articleTotal;
	data['update_total'] = entity.updateTotal;
	data['is_discount'] = entity.isDiscount;
	data['discount'] = entity.discount;
	data['avatar'] = entity.avatar;
	data['summary'] = entity.summary;
	data['title'] = entity.title;
	data['released_at'] = entity.releasedAt;
	data['fee'] = entity.fee;
	data['user_id'] = entity.userId;
	data['discount_stime'] = entity.discountStime;
	data['discount_etime'] = entity.discountEtime;
	data['sell_status'] = entity.sellStatus;
	return data;
}