import 'package:sspai/bean/homesub_entity.dart';
import 'package:sspai/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

homesubEntityFromJson(HomesubEntity data, Map<String, dynamic> json) {
	data.error = json['error']?.toInt();
	if (json['data'] != null) {
		data.data = new List<HomesubData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HomesubData().fromJson(v));
		});
	}
	data.total = json['total']?.toInt();
	return data;
}

Map<String, dynamic> homesubEntityToJson(HomesubEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	return data;
}

homesubDataFromJson(HomesubData data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.adApi = json['ad_api']?.toString();
	data.adType = json['ad_type']?.toInt();
	data.createdAt = json['created_at']?.toInt();
	data.image = json['image']?.toString();
	data.memo = json['memo']?.toString();
	data.title = json['title']?.toString();
	data.type = json['type']?.toInt();
	data.url = json['url']?.toString();
	data.code = json['code']?.toString();
	data.redirectShortUrl = json['redirect_short_url']?.toString();
	data.weight = json['weight']?.toInt();
	return data;
}

Map<String, dynamic> homesubDataToJson(HomesubData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['ad_api'] = entity.adApi;
	data['ad_type'] = entity.adType;
	data['created_at'] = entity.createdAt;
	data['image'] = entity.image;
	data['memo'] = entity.memo;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['code'] = entity.code;
	data['redirect_short_url'] = entity.redirectShortUrl;
	data['weight'] = entity.weight;
	return data;
}