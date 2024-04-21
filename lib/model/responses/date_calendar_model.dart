import 'package:pocketbook/model/responses/kid_confirm_model.dart';

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


class YearModel {
  int year = DateTime.now().year;
  bool isDropdown = true;
  List<KidGroupConfirmModel> listMonths = [];

  YearModel({
    required this.year,
    required this.isDropdown,
    required this.listMonths,
  });
}
