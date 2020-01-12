class API {
  static getIndex(int count, int offset) {
    return "https://ios.sspai.com/api/v1/index/article/get?offset=$offset&recommend_to_home_at=0&type=index&user_id=0&limit=$count";
  }

  static getMatrix(int count, int offset) {
    return "https://sspai.com/api/v1/article/matrix/page/get?limit=$count&offset=$offset";
  }

  static getComment(int count, int offset, int id) {
    return "https://sspai.com/api/v1/comment/user/article/hot/page/get?limit=$count&offset=$offset&article_id=$id";
  }

  static getPayCard(int offset) {
    return "https://ios.sspai.com/api/v1/series/page/get?offset=$offset&released_at=${DateTime.now().millisecondsSinceEpoch ~/ 1000}";
  }

  static getHomeSub(int count, int offset) {
    return "https://sspai.com/api/v1/recommend/page/get?limit=$count&offset=$offset&type=home_sub";
  }
}
