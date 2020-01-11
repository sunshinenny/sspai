class PathConvert {
  static String getWholeImagePath(String path) {
    //    print(path);
    if (path == "") {
      return "https://cdn.sspai.com/sspai/assets/img/favicon/icon.ico";
    }
    if (path.contains("https://cdn.sspai.com")) {
      return path;
    } else {
      if (path.startsWith("/")) {
        return "https://cdn.sspai.com" + path;
      } else {
        return "https://cdn.sspai.com/" + path;
      }
    }
  }
}
