class DateDifference {
  static String Ilya(DateTime date1, DateTime date2) {
    Duration difference = date2.difference(date1);
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;
    int months = (date2.year - date1.year) * 12 + date2.month - date1.month;
    int years = date2.year - date1.year;

    String timeAgo;

    if (years > 0) {
      timeAgo = 'il y a $years an${years == 1 ? '' : 's'}';
    } else if (months > 0) {
      timeAgo = 'il y a $months mois';
    } else if (days > 0) {
      timeAgo = 'il y a $days jour${days == 1 ? '' : 's'}';
    } else if (hours > 0) {
      timeAgo = 'il y a $hours heure${hours == 1 ? '' : 's'}';
    } else if (minutes > 0) {
      timeAgo = 'il y a $minutes minute${minutes == 1 ? '' : 's'}';
    } else {
      timeAgo = "A l'instant";
    }

    return timeAgo;
  }



  static String time(DateTime date1, DateTime date2) {
    Duration difference = date2.difference(date1);
    int minutes = difference.inMinutes;
    int hours = difference.inHours;
    int days = difference.inDays;
    int months = (date2.year - date1.year) * 12 + date2.month - date1.month;
    int years = date2.year - date1.year;

    String timeAgo;

    if (years > 0) {
      timeAgo = '$years an${years == 1 ? '' : 's'}';
    } else if (months > 0) {
      timeAgo = '$months mois';
    } else if (days > 0) {
      timeAgo = '$days jour${days == 1 ? '' : 's'}';
    } else if(days == 0){
      timeAgo = '${date1.hour}:${date1.minute}';
    }
    // } else if (hours > 0) {
    //   timeAgo = '$hours heure${hours == 1 ? '' : 's'}';
    // } else if (minutes > 0) {
    //   timeAgo = '$minutes minute${minutes == 1 ? '' : 's'}';
    // } 
    else {
      timeAgo = "A l'instant";
    }

    return timeAgo;
  }

  static DateTime DateFromServerToDateTime(DateFromServer) {
    String year = DateFromServer["date"].toString().split("-").first;
    String month = DateFromServer["date"].toString().split("-")[1];
    String day =
        DateFromServer["date"].toString().split("-").last.split(" ").first;
    String hour = DateFromServer["date"]
        .toString()
        .split("-")
        .last
        .split(" ")
        .last
        .split(":")
        .first;
    String minute = DateFromServer["date"]
        .toString()
        .split("-")
        .last
        .split(" ")
        .last
        .split(":")[1];
    return DateTime(
      int.parse(year),
      int.parse(month),
      int.parse(day),
      int.parse(hour),
      int.parse(minute),
    );
  }
}
