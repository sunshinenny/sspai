import 'package:sspai/bean/index_entity.dart';
import 'package:sspai/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

indexEntityFromJson(IndexEntity data, Map<String, dynamic> json) {
	data.error = json['error']?.toInt();
	if (json['data'] != null) {
		data.data = new List<IndexData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new IndexData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> indexEntityToJson(IndexEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

indexDataFromJson(IndexData data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.banner = json['banner']?.toString();
	data.title = json['title']?.toString();
	data.releasedAt = json['released_at']?.toInt();
	data.commentTotal = json['comment_total']?.toInt();
	data.likeTotal = json['like_total']?.toInt();
	data.viewsCount = json['views_count']?.toInt();
	data.summary = json['summary']?.toString();
	data.recommendToHomeAt = json['recommend_to_home_at']?.toInt();
	data.liked = json['liked'];
	data.favorited = json['favorited'];
	data.author = json['author'] != null ? new IndexDataAuthor().fromJson(json['author']) : null;
	data.promoteIntro = json['promote_intro']?.toString();
	data.promoteTitle = json['promote_title']?.toString();
	data.promoteImage = json['promote_image']?.toString();
	data.showIos = json['show_ios']?.toInt();
	data.advertisementUrl = json['advertisement_url']?.toString();
	data.commentFileOn = json['comment_file_on'];
	data.free = json['free']?.toInt();
	data.seriesId = json['series_id']?.toInt();
	return data;
}

Map<String, dynamic> indexDataToJson(IndexData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['banner'] = entity.banner;
	data['title'] = entity.title;
	data['released_at'] = entity.releasedAt;
	data['comment_total'] = entity.commentTotal;
	data['like_total'] = entity.likeTotal;
	data['views_count'] = entity.viewsCount;
	data['summary'] = entity.summary;
	data['recommend_to_home_at'] = entity.recommendToHomeAt;
	data['liked'] = entity.liked;
	data['favorited'] = entity.favorited;
	if (entity.author != null) {
		data['author'] = IndexDataAuthor().toJson();
	}
	data['promote_intro'] = entity.promoteIntro;
	data['promote_title'] = entity.promoteTitle;
	data['promote_image'] = entity.promoteImage;
	data['show_ios'] = entity.showIos;
	data['advertisement_url'] = entity.advertisementUrl;
	data['comment_file_on'] = entity.commentFileOn;
	data['free'] = entity.free;
	data['series_id'] = entity.seriesId;
	return data;
}

indexDataAuthorFromJson(IndexDataAuthor data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	return data;
}

Map<String, dynamic> indexDataAuthorToJson(IndexDataAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	return data;
}