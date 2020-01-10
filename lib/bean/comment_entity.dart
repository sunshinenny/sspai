import 'package:sspai/generated/json/base/json_convert_content.dart';
import 'package:sspai/generated/json/base/json_filed.dart';

class CommentEntity with JsonConvert<CommentEntity> {
	int error;
	String msg;
	List<CommentData> data;
	int total;
}

class CommentData with JsonConvert<CommentData> {
	int id;
	String comment;
	bool blocked;
	@JSONField(name: "created_at")
	int createdAt;
	bool liked;
	@JSONField(name: "likes_count")
	int likesCount;
	bool chosen;
	@JSONField(name: "hide")
	bool xHide;
	@JSONField(name: "liked_status")
	int likedStatus;
	@JSONField(name: "unlikes_count")
	int unlikesCount;
	@JSONField(name: "comment_files")
	List<dynamic> commentFiles;
	CommentDataUser user;
	List<CommantDataReply> reply;
	@JSONField(name: "author_blocked")
	bool authorBlocked;
	CommentDataArticle article;
	CommentDataSeries series;
	bool top;
	@JSONField(name: "is_author")
	bool isAuthor;
	List<dynamic> flags;
}

class CommentDataUser with JsonConvert<CommentDataUser> {
	int id;
	String slug;
	String avatar;
	String nickname;
	@JSONField(name: "power_plus_flag")
	int powerPlusFlag;
	@JSONField(name: "user_flags")
	List<dynamic> userFlags;
	@JSONField(name: "user_badges")
	List<dynamic> userBadges;
}

class CommantDataReply with JsonConvert<CommantDataReply> {
	int id;
	String comment;
	bool blocked;
	@JSONField(name: "created_at")
	int createdAt;
	bool liked;
	@JSONField(name: "likes_count")
	int likesCount;
	@JSONField(name: "hide")
	bool xHide;
	@JSONField(name: "liked_status")
	int likedStatus;
	@JSONField(name: "unlikes_count")
	int unlikesCount;
	@JSONField(name: "comment_files")
	List<dynamic> commentFiles;
	CommentDataReplyAuthor author;
	CommentDataReplyUser user;
	@JSONField(name: "comment_reply_unlike_count")
	int commentReplyUnlikeCount;
	@JSONField(name: "author_blocked")
	bool authorBlocked;
	bool chosen;
	bool top;
	@JSONField(name: "is_author")
	bool isAuthor;
	List<dynamic> flags;
}

class CommentDataReplyAuthor with JsonConvert<CommentDataReplyAuthor> {
	int id;
	String slug;
	String avatar;
	String nickname;
	@JSONField(name: "power_plus_flag")
	int powerPlusFlag;
	@JSONField(name: "user_flags")
	List<dynamic> userFlags;
	@JSONField(name: "user_badges")
	List<dynamic> userBadges;
}

class CommentDataReplyUser with JsonConvert<CommentDataReplyUser> {
	int id;
	String slug;
	String avatar;
	String nickname;
	@JSONField(name: "power_plus_flag")
	int powerPlusFlag;
	@JSONField(name: "user_flags")
	List<dynamic> userFlags;
	@JSONField(name: "user_badges")
	List<dynamic> userBadges;
}

class CommentDataArticle with JsonConvert<CommentDataArticle> {
	int id;
	String title;
	@JSONField(name: "is_free")
	int isFree;
	bool deleted;
	bool blocked;
	@JSONField(name: "comment_file_on")
	bool commentFileOn;
	@JSONField(name: "allow_comment")
	bool allowComment;
	@JSONField(name: "author_series_article_manage_on")
	bool authorSeriesArticleManageOn;
	CommentDataArticleAuthor author;
}

class CommentDataArticleAuthor with JsonConvert<CommentDataArticleAuthor> {
	int id;
	String slug;
	String avatar;
	String nickname;
	@JSONField(name: "power_plus_flag")
	int powerPlusFlag;
	@JSONField(name: "user_flags")
	List<dynamic> userFlags;
	@JSONField(name: "user_badges")
	List<dynamic> userBadges;
}

class CommentDataSeries with JsonConvert<CommentDataSeries> {
	int id;
	String title;
	@JSONField(name: "is_author")
	bool isAuthor;
	CommentDataSeriesAuthor author;
}

class CommentDataSeriesAuthor with JsonConvert<CommentDataSeriesAuthor> {
	int id;
	String slug;
	String avatar;
	String nickname;
	@JSONField(name: "power_plus_flag")
	int powerPlusFlag;
	@JSONField(name: "user_flags")
	List<dynamic> userFlags;
	@JSONField(name: "user_badges")
	List<dynamic> userBadges;
}
