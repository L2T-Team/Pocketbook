import 'package:get/get.dart';
import 'package:pocketbook/model/responses/date_calendar_model.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class KidController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  KidController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<DateTime> currentDate = Rx<DateTime>(
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ),
  );
  RxList<List<DateCalendarModel>> listDate = <List<DateCalendarModel>>[].obs;

  /// Init
  @override
  void onInit() {
    super.onInit();
    final listStart = getMonthDates(currentDate.value);
    listDate.value = [listStart];
  }

  List<DateCalendarModel> getMonthDates(DateTime now) {
    // Get the first day of the current month.
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);

    // Get the last day of the current month.
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    // Get the first day to be shown in the calendar view.
    DateTime start = firstDayOfMonth;
    while (start.weekday != DateTime.monday) {
      // Start on Monday
      start = start.subtract(const Duration(days: 1));
    }

    // Get the last day to be shown in the calendar view.
    DateTime end = lastDayOfMonth;
    while (end.weekday != DateTime.sunday) {
      // End on Sunday for a Monday-started week
      end = end.add(const Duration(days: 1));
    }

    // Generate the list of dates.
    List<DateCalendarModel> dates = [];
    for (DateTime date = start;
        date.isBefore(end.add(const Duration(days: 1)));
        date = date.add(const Duration(days: 1))) {
      dates.add(
        DateCalendarModel(
          datetime: date,
          event: '',
          isCurrentMonth: AppHelper.checkSameMonth(date, now),
        ),
      );
    }

    return dates;
  }

  /// Next Date
  void nextDateAction() {
    currentDate.value = currentDate.value.add(const Duration(days: 1));
  }

  /// Previous Date
  void previousDateAction() {
    currentDate.value = currentDate.value.subtract(const Duration(days: 1));
  }
}
