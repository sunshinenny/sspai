class PathConvert {
  static String getWholeImagePath(String path) {
    if (path.contains("https://cnd.sspai.com")) {
      return path;
    } else {
      if (path.startsWith("/")) {
        print('startwith /' + "https://cnd.sspai.com" + path);
        return "https://cnd.sspai.com" + path;
      } else {
        print("https://cnd.sspai.com/" + path);
        return "https://cnd.sspai.com/" + path;
      }
    }
  }
}
