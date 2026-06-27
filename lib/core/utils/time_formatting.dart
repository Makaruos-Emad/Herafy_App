import 'package:intl/intl.dart';

String formatTime(String time) {
  final inputFormat = DateFormat("HH:mm:ss");
  final outputFormat = DateFormat("hh:mm a", "ar");

  final dateTime = inputFormat.parse(time);
  return outputFormat.format(dateTime);
}

String formatDate(String date) {
  final dateTime = DateTime.parse(date);
  final now = DateTime.now();
  String day;
  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    day = 'اليوم';
  } else if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day + 1) {
    day = 'غداً';
  } else {
    day = DateFormat('EEEE', 'ar').format(dateTime);
  }
  final time = DateFormat('hh:mm a', 'ar').format(dateTime);
  return '$day، $time';
}

String timeAgo(String time) {
  final now = DateTime.now();

  final parts = time.split(':');
  final date = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(parts[0]),
    int.parse(parts[1]),
    int.parse(parts[2]),
  );

  final diff = now.difference(date);

  if (diff.inSeconds < 60) {
    return 'منذ ${diff.inSeconds} ثانية';
  } else if (diff.inMinutes < 60) {
    return 'منذ ${diff.inMinutes} دقيقة';
  } else if (diff.inHours < 24) {
    return 'منذ ${diff.inHours} ساعة';
  } else {
    return 'منذ ${diff.inDays} يوم';
  }
}
