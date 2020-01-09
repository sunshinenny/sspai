import 'package:sspai/generated/json/base/json_convert_content.dart';
import 'package:sspai/generated/json/base/json_filed.dart';

class MatrixEntity with JsonConvert<MatrixEntity> {
	int error;
	String msg;
	List<MatrixData> data;
	int total;
}

class MatrixData with JsonConvert<MatrixData> {
	int id;
	String title;
	String banner;
	String summary;
	@JSONField(name: "comment_count")
	int commentCount;
	@JSONField(name: "like_count")
	int likeCount;
	@JSONField(name: "view_count")
	int viewCount;
	bool free;
	@JSONField(name: "post_type")
	int postType;
	int important;
	@JSONField(name: "released_time")
	int releasedTime;
	@JSONField(name: "morning_paper_title")
	List<dynamic> morningPaperTitle;
	@JSONField(name: "advertisement_url")
	String advertisementUrl;
	List<dynamic> series;
	MatrixDataAuthor author;
	MatrixDataCorner corner;
	@JSONField(name: "special_columns")
	List<dynamic> specialColumns;
	int status;
}

class MatrixDataAuthor with JsonConvert<MatrixDataAuthor> {
	int id;
	String slug;
	String avatar;
	String nickname;
}

class MatrixDataCorner with JsonConvert<MatrixDataCorner> {
	int id;
	String name;
	String url;
	String icon;
	String memo;
	String color;
}
