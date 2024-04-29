import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbook/model/responses/date_calendar_model.dart';
import 'package:pocketbook/model/responses/kid_confirm_model.dart';
import 'package:pocketbook/utils/app_constant.dart';
import 'package:pocketbook/utils/app_helper.dart';
import 'package:pocketbook/utils/app_routes.dart';
import 'package:pocketbook/views/kid/widget/confirm_visit_popup.dart';
import 'package:pocketbook/views/kid/widget/delete_kid_day_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';
import 'package:uuid/uuid.dart';

class KidController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  KidController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<List<KidConfirmModel>> listKids = Rx<List<KidConfirmModel>>([]);
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
    initData();
    getKidConfirms();
  }

  /// On Ready
  @override
  void onReady() {
    super.onReady();
    AppHelper.checkAuthorization();
  }

  //////////////////////////////////////////////////////////
  /// Get Kid Confirm
  //////////////////////////////////////////////////////////
  void getKidConfirms() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final List<KidConfirmModel> listKidsConfirm = [];
      final listFirebase = (await FirebaseFirestore.instance
              .collection(CollectionConstant.user)
              .doc(user?.uid ?? '')
              .collection(CollectionConstant.kidConfirm)
              .get())
          .docs;

      for (var it in listFirebase) {
        listKidsConfirm.add(KidConfirmModel.fromJson(it));
      }

      /// Sort
      listKidsConfirm.sort((a, b) {
        final date1 = AppHelper.convertStringToDateWithFormat(
          a.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        final date2 = AppHelper.convertStringToDateWithFormat(
          b.date ?? '',
          DateConstant.dateMMddYYYY,
        );
        return date2.compareTo(date1);
      });

      listKids.value = listKidsConfirm;
    } catch (_) {}
  }

  //////////////////////////////////////////////////////////
  /// Add Kid Confirm
  //////////////////////////////////////////////////////////
  void addKidConfirm(DateTime date) async {
    try {
      final uuid = (const Uuid().v4());
      final user = FirebaseAuth.instance.currentUser;
      final KidConfirmModel request = KidConfirmModel(
        id: uuid,
        date: AppHelper.convertDatetoStringWithFormat(
          date,
          DateConstant.dateMMddYYYY,
        ),
      );

      /// Add New
      await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.kidConfirm)
          .doc(uuid)
          .set(request.toJson());

      getKidConfirms();
    } catch (_) {}
  }

  /// Init data
  void initData() {
    final listStart = getMonthDates(currentDate.value);
    listDate.value = [listStart];
  }

  /// Get month dates
  List<DateCalendarModel> getMonthDates(DateTime now) {
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    DateTime start = firstDayOfMonth;
    while (start.weekday != DateTime.monday) {
      start = start.subtract(const Duration(days: 1));
    }
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
    if (currentDate.value.month == 12) {
      currentDate.value = DateTime(
        currentDate.value.year + 1,
        1,
        1,
      );
    } else {
      currentDate.value = DateTime(
        currentDate.value.year,
        currentDate.value.month + 1,
        1,
      );
    }
    initData();
  }

  /// Previous Date
  void previousDateAction() {
    if (currentDate.value.month == 1) {
      currentDate.value = DateTime(
        currentDate.value.year - 1,
        12,
        1,
      );
    } else {
      currentDate.value = DateTime(
        currentDate.value.year,
        currentDate.value.month - 1,
        1,
      );
    }
    initData();
  }

  /// Confirm Kid
  void confirmKidAction(
    BuildContext context,
    DateTime date,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return ConfirmVisitPopup(
          confirmAction: () {
            addKidConfirm(date);
          },
        );
      },
    );
  }

  /// Navigate Hiostory
  void navigateHistory() {
    Get.toNamed(
      RoutesName.historyKid,
      arguments: listKids.value,
    );
  }

  /// Delete Kid Day
  void deleteKidDayAction(BuildContext context, KidConfirmModel kidDay) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return DeleteKidDayPopup(
          deleteAction: () {
            deleteKidDay(kidDay);
          },
        );
      },
    );
  }

  //////////////////////////////////////////////////////////
  /// Delete Kid Day
  //////////////////////////////////////////////////////////
  void deleteKidDay(KidConfirmModel kidDay) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      (await FirebaseFirestore.instance
          .collection(CollectionConstant.user)
          .doc(user?.uid ?? '')
          .collection(CollectionConstant.kidConfirm)
          .doc(kidDay.id ?? '')
          .delete());
      getKidConfirms();
      Get.back();
    } catch (_) {}
  }
}
