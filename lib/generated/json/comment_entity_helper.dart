import 'package:sspai/bean/comment_entity.dart';
import 'package:sspai/generated/json/base/json_filed.dart';
import 'package:intl/intl.dart';

commentEntityFromJson(CommentEntity data, Map<String, dynamic> json) {
	data.error = json['error']?.toInt();
	data.msg = json['msg']?.toString();
	if (json['data'] != null) {
		data.data = new List<CommentData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CommentData().fromJson(v));
		});
	}
	data.total = json['total']?.toInt();
	return data;
}

Map<String, dynamic> commentEntityToJson(CommentEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	return data;
}

commentDataFromJson(CommentData data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.comment = json['comment']?.toString();
	data.blocked = json['blocked'];
	data.createdAt = json['created_at']?.toInt();
	data.liked = json['liked'];
	data.likesCount = json['likes_count']?.toInt();
	data.chosen = json['chosen'];
	data.xHide = json['hide'];
	data.likedStatus = json['liked_status']?.toInt();
	data.unlikesCount = json['unlikes_count']?.toInt();
	if (json['comment_files'] != null) {
		data.commentFiles = new List<dynamic>();
		data.commentFiles.addAll(json['comment_files']);
	}
	data.user = json['user'] != null ? new CommentDataUser().fromJson(json['user']) : null;
	if (json['reply'] != null) {
		data.reply = new List<CommantDataReply>();
		(json['reply'] as List).forEach((v) {
			data.reply.add(new CommantDataReply().fromJson(v));
		});
	}
	data.authorBlocked = json['author_blocked'];
	data.article = json['article'] != null ? new CommentDataArticle().fromJson(json['article']) : null;
	data.series = json['series'] != null ? new CommentDataSeries().fromJson(json['series']) : null;
	data.top = json['top'];
	data.isAuthor = json['is_author'];
	if (json['flags'] != null) {
		data.flags = new List<dynamic>();
		data.flags.addAll(json['flags']);
	}
	return data;
}

Map<String, dynamic> commentDataToJson(CommentData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['comment'] = entity.comment;
	data['blocked'] = entity.blocked;
	data['created_at'] = entity.createdAt;
	data['liked'] = entity.liked;
	data['likes_count'] = entity.likesCount;
	data['chosen'] = entity.chosen;
	data['hide'] = entity.xHide;
	data['liked_status'] = entity.likedStatus;
	data['unlikes_count'] = entity.unlikesCount;
	if (entity.commentFiles != null) {
		data['comment_files'] =  [];
	}
	if (entity.user != null) {
		data['user'] = CommentDataUser().toJson();
	}
	if (entity.reply != null) {
		data['reply'] =  entity.reply.map((v) => v.toJson()).toList();
	}
	data['author_blocked'] = entity.authorBlocked;
	if (entity.article != null) {
		data['article'] = CommentDataArticle().toJson();
	}
	if (entity.series != null) {
		data['series'] = CommentDataSeries().toJson();
	}
	data['top'] = entity.top;
	data['is_author'] = entity.isAuthor;
	if (entity.flags != null) {
		data['flags'] =  [];
	}
	return data;
}

commentDataUserFromJson(CommentDataUser data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	data.powerPlusFlag = json['power_plus_flag']?.toInt();
	if (json['user_flags'] != null) {
		data.userFlags = new List<dynamic>();
		data.userFlags.addAll(json['user_flags']);
	}
	if (json['user_badges'] != null) {
		data.userBadges = new List<dynamic>();
		data.userBadges.addAll(json['user_badges']);
	}
	return data;
}

Map<String, dynamic> commentDataUserToJson(CommentDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	data['power_plus_flag'] = entity.powerPlusFlag;
	if (entity.userFlags != null) {
		data['user_flags'] =  [];
	}
	if (entity.userBadges != null) {
		data['user_badges'] =  [];
	}
	return data;
}

commantDataReplyFromJson(CommantDataReply data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.comment = json['comment']?.toString();
	data.blocked = json['blocked'];
	data.createdAt = json['created_at']?.toInt();
	data.liked = json['liked'];
	data.likesCount = json['likes_count']?.toInt();
	data.xHide = json['hide'];
	data.likedStatus = json['liked_status']?.toInt();
	data.unlikesCount = json['unlikes_count']?.toInt();
	if (json['comment_files'] != null) {
		data.commentFiles = new List<dynamic>();
		data.commentFiles.addAll(json['comment_files']);
	}
	data.author = json['author'] != null ? new CommentDataReplyAuthor().fromJson(json['author']) : null;
	data.user = json['user'] != null ? new CommentDataReplyUser().fromJson(json['user']) : null;
	data.commentReplyUnlikeCount = json['comment_reply_unlike_count']?.toInt();
	data.authorBlocked = json['author_blocked'];
	data.chosen = json['chosen'];
	data.top = json['top'];
	data.isAuthor = json['is_author'];
	if (json['flags'] != null) {
		data.flags = new List<dynamic>();
		data.flags.addAll(json['flags']);
	}
	return data;
}

Map<String, dynamic> commantDataReplyToJson(CommantDataReply entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['comment'] = entity.comment;
	data['blocked'] = entity.blocked;
	data['created_at'] = entity.createdAt;
	data['liked'] = entity.liked;
	data['likes_count'] = entity.likesCount;
	data['hide'] = entity.xHide;
	data['liked_status'] = entity.likedStatus;
	data['unlikes_count'] = entity.unlikesCount;
	if (entity.commentFiles != null) {
		data['comment_files'] =  [];
	}
	if (entity.author != null) {
		data['author'] = CommentDataReplyAuthor().toJson();
	}
	if (entity.user != null) {
		data['user'] = CommentDataReplyUser().toJson();
	}
	data['comment_reply_unlike_count'] = entity.commentReplyUnlikeCount;
	data['author_blocked'] = entity.authorBlocked;
	data['chosen'] = entity.chosen;
	data['top'] = entity.top;
	data['is_author'] = entity.isAuthor;
	if (entity.flags != null) {
		data['flags'] =  [];
	}
	return data;
}

commentDataReplyAuthorFromJson(CommentDataReplyAuthor data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	data.powerPlusFlag = json['power_plus_flag']?.toInt();
	if (json['user_flags'] != null) {
		data.userFlags = new List<dynamic>();
		data.userFlags.addAll(json['user_flags']);
	}
	if (json['user_badges'] != null) {
		data.userBadges = new List<dynamic>();
		data.userBadges.addAll(json['user_badges']);
	}
	return data;
}

Map<String, dynamic> commentDataReplyAuthorToJson(CommentDataReplyAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	data['power_plus_flag'] = entity.powerPlusFlag;
	if (entity.userFlags != null) {
		data['user_flags'] =  [];
	}
	if (entity.userBadges != null) {
		data['user_badges'] =  [];
	}
	return data;
}

commentDataReplyUserFromJson(CommentDataReplyUser data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	data.powerPlusFlag = json['power_plus_flag']?.toInt();
	if (json['user_flags'] != null) {
		data.userFlags = new List<dynamic>();
		data.userFlags.addAll(json['user_flags']);
	}
	if (json['user_badges'] != null) {
		data.userBadges = new List<dynamic>();
		data.userBadges.addAll(json['user_badges']);
	}
	return data;
}

Map<String, dynamic> commentDataReplyUserToJson(CommentDataReplyUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	data['power_plus_flag'] = entity.powerPlusFlag;
	if (entity.userFlags != null) {
		data['user_flags'] =  [];
	}
	if (entity.userBadges != null) {
		data['user_badges'] =  [];
	}
	return data;
}

commentDataArticleFromJson(CommentDataArticle data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.title = json['title']?.toString();
	data.isFree = json['is_free']?.toInt();
	data.deleted = json['deleted'];
	data.blocked = json['blocked'];
	data.commentFileOn = json['comment_file_on'];
	data.allowComment = json['allow_comment'];
	data.authorSeriesArticleManageOn = json['author_series_article_manage_on'];
	data.author = json['author'] != null ? new CommentDataArticleAuthor().fromJson(json['author']) : null;
	return data;
}

Map<String, dynamic> commentDataArticleToJson(CommentDataArticle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['is_free'] = entity.isFree;
	data['deleted'] = entity.deleted;
	data['blocked'] = entity.blocked;
	data['comment_file_on'] = entity.commentFileOn;
	data['allow_comment'] = entity.allowComment;
	data['author_series_article_manage_on'] = entity.authorSeriesArticleManageOn;
	if (entity.author != null) {
		data['author'] = CommentDataArticleAuthor().toJson();
	}
	return data;
}

commentDataArticleAuthorFromJson(CommentDataArticleAuthor data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	data.powerPlusFlag = json['power_plus_flag']?.toInt();
	if (json['user_flags'] != null) {
		data.userFlags = new List<dynamic>();
		data.userFlags.addAll(json['user_flags']);
	}
	if (json['user_badges'] != null) {
		data.userBadges = new List<dynamic>();
		data.userBadges.addAll(json['user_badges']);
	}
	return data;
}

Map<String, dynamic> commentDataArticleAuthorToJson(CommentDataArticleAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	data['power_plus_flag'] = entity.powerPlusFlag;
	if (entity.userFlags != null) {
		data['user_flags'] =  [];
	}
	if (entity.userBadges != null) {
		data['user_badges'] =  [];
	}
	return data;
}

commentDataSeriesFromJson(CommentDataSeries data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.title = json['title']?.toString();
	data.isAuthor = json['is_author'];
	data.author = json['author'] != null ? new CommentDataSeriesAuthor().fromJson(json['author']) : null;
	return data;
}

Map<String, dynamic> commentDataSeriesToJson(CommentDataSeries entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['is_author'] = entity.isAuthor;
	if (entity.author != null) {
		data['author'] = CommentDataSeriesAuthor().toJson();
	}
	return data;
}

commentDataSeriesAuthorFromJson(CommentDataSeriesAuthor data, Map<String, dynamic> json) {
	data.id = json['id']?.toInt();
	data.slug = json['slug']?.toString();
	data.avatar = json['avatar']?.toString();
	data.nickname = json['nickname']?.toString();
	data.powerPlusFlag = json['power_plus_flag']?.toInt();
	if (json['user_flags'] != null) {
		data.userFlags = new List<dynamic>();
		data.userFlags.addAll(json['user_flags']);
	}
	if (json['user_badges'] != null) {
		data.userBadges = new List<dynamic>();
		data.userBadges.addAll(json['user_badges']);
	}
	return data;
}

Map<String, dynamic> commentDataSeriesAuthorToJson(CommentDataSeriesAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['slug'] = entity.slug;
	data['avatar'] = entity.avatar;
	data['nickname'] = entity.nickname;
	data['power_plus_flag'] = entity.powerPlusFlag;
	if (entity.userFlags != null) {
		data['user_flags'] =  [];
	}
	if (entity.userBadges != null) {
		data['user_badges'] =  [];
	}
	return data;
}