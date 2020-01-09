import 'package:sspai/generated/json/base/json_convert_content.dart';
import 'package:sspai/generated/json/base/json_filed.dart';

class IndexEntity with JsonConvert<IndexEntity> {
	int error;
	List<IndexData> data;
}

class IndexData with JsonConvert<IndexData> {
	int id;
	String banner;
	String title;
	@JSONField(name: "released_at")
	int releasedAt;
	@JSONField(name: "comment_total")
	int commentTotal;
	@JSONField(name: "like_total")
	int likeTotal;
	@JSONField(name: "views_count")
	int viewsCount;
	String summary;
	@JSONField(name: "recommend_to_home_at")
	int recommendToHomeAt;
	bool liked;
	bool favorited;
	IndexDataAuthor author;
	@JSONField(name: "promote_intro")
	String promoteIntro;
	@JSONField(name: "promote_title")
	String promoteTitle;
	@JSONField(name: "promote_image")
	String promoteImage;
	@JSONField(name: "show_ios")
	int showIos;
	@JSONField(name: "advertisement_url")
	String advertisementUrl;
	@JSONField(name: "comment_file_on")
	bool commentFileOn;
	int free;
	@JSONField(name: "series_id")
	int seriesId;
}

class IndexDataAuthor with JsonConvert<IndexDataAuthor> {
	int id;
	String avatar;
	String nickname;
}
