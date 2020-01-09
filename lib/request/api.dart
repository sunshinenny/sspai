class API {
  static getIndex(int count, int offset) {
    return "https://ios.sspai.com/api/v1/index/article/get?offset=$offset&recommend_to_home_at=0&type=index&user_id=0&limit=$count";
  }

  static getMatrix(int count, int offset) {
    return "https://sspai.com/api/v1/article/matrix/page/get?limit=$count&offset=$offset";
  }
}
