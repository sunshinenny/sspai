import 'package:sspai/generated/json/base/json_convert_content.dart';
import 'package:sspai/generated/json/base/json_filed.dart';

class HomesubEntity with JsonConvert<HomesubEntity> {
	int error;
	List<HomesubData> data;
	int total;
}

class HomesubData with JsonConvert<HomesubData> {
	int id;
	@JSONField(name: "ad_api")
	String adApi;
	@JSONField(name: "ad_type")
	int adType;
	@JSONField(name: "created_at")
	int createdAt;
	String image;
	String memo;
	String title;
	int type;
	String url;
	String code;
	@JSONField(name: "redirect_short_url")
	String redirectShortUrl;
	int weight;
}
