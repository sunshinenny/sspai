import 'package:sspai/bean/matrix_entity.dart';

matrixEntityFromJson(MatrixEntity data, Map<String, dynamic> json) {
	data.error = json['error']?.toInt();
	data.msg = json['msg']?.toString();
	if (json['data'] != null) {
		data.data = new List<MatrixData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new MatrixData().fromJson(v));
		});
	}
	data.total = json['total']?.toInt();
	return data;
}

Map<String, dynamic> matrixEntityToJson(MatrixEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	return data;
}

matrixDataFromJson(MatrixData data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.title = json['title']?.toString();
	data.banner = json['banner']?.toString();
	data.summary = json['summary']?.toString();
	data.commentCount = json['comment_count']?.toInt();
	data.likeCount = json['like_count']?.toInt();
	data.viewCount = json['view_count']?.toInt();
	data.free = json['free'];
	data.postType = json['post_type']?.toInt();
	data.important = json['important']?.toInt();
	data.releasedTime = json['released_time']?.toInt();
	if (json['morning_paper_title'] != null) {
		data.morningPaperTitle = new List<dynamic>();
		data.morningPaperTitle.addAll(json['morning_paper_title']);
	}
	data.advertisementUrl = json['advertisement_url']?.toString();
	if (json['series'] != null) {
		data.series = new List<dynamic>();
		data.series.addAll(json['series']);
	}
	data.author = json['author'] != null ? new MatrixDataAuthor().fromJson(json['author']) : null;
	data.corner = json['corner'] != null ? new MatrixDataCorner().fromJson(json['corner']) : null;
	if (json['special_columns'] != null) {
		data.specialColumns = new List<dynamic>();
		data.specialColumns.addAll(json['special_columns']);
	}
	data.status = json['status']?.toInt();
	return data;
}

Map<String, dynamic> matrixDataToJson(MatrixData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['banner'] = entity.banner;
	data['summary'] = entity.summary;
	data['comment_count'] = entity.commentCount;
	data['like_count'] = entity.likeCount;
	data['view_count'] = entity.viewCount;
	data['free'] = entity.free;
	data['post_type'] = entity.postType;
	data['important'] = entity.important;
	data['released_time'] = entity.releasedTime;
	if (entity.morningPaperTitle != null) {
		data['morning_paper_title'] =  [];
	}
	data['advertisement_url'] = entity.advertisementUrl;
	if (entity.series != null) {
		data['series'] =  [];
	}
	if (entity.author != null) {
		data['author'] = MatrixDataAuthor().toJson();
	}
	if (entity.corner != null) {
		data['corner'] = MatrixDataCorner().toJson();
	}
	if (entity.specialColumns != null) {
		data['special_columns'] =  [];
	}
	data['status'] = entity.status;
	return data;
}

matrixDataAuthorFromJson(MatrixDataAuthor data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	return data;
}

Map<String, dynamic> matrixDataAuthorToJson(MatrixDataAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	return data;
}

matrixDataCornerFromJson(MatrixDataCorner data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.name = json['name']?.toString();
	data.url = json['url']?.toString();
	data.icon = json['icon']?.toString();
	data.memo = json['memo']?.toString();
	data.color = json['color']?.toString();
	return data;
}

Map<String, dynamic> matrixDataCornerToJson(MatrixDataCorner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['url'] = entity.url;
	data['icon'] = entity.icon;
	data['memo'] = entity.memo;
	data['color'] = entity.color;
	return data;
}