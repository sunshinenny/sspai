class FeedAttribute {
  int id;
  String title;
  String avatar;
  String nickname;
  int likeCount;
  int commentCount;
  int releasedTime;
  String banner;

  FeedAttribute(this.id, this.title, this.avatar, this.nickname, this.likeCount,
      this.commentCount, this.releasedTime, this.banner);

  FeedAttribute.name(this.id, this.title, this.avatar, this.nickname,
      this.likeCount, this.commentCount, this.releasedTime, this.banner);


}
