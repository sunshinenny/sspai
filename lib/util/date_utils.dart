class DateUtils {
  static String getYYYYMMDD(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return "${dateTime.year}年${dateTime.month}月${dateTime.day}日";
  }
}
