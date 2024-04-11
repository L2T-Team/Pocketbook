class DateCalendarModel {
  DateTime datetime = DateTime.now();
  String event = '';
  bool isCurrentMonth = true;

  DateCalendarModel({
    required this.datetime,
    required this.event,
    required this.isCurrentMonth,
  });
}
