import 'package:get/get.dart';
import 'package:pocketbook/views/home/add_edit_transaction/add_edit_transaction_binding.dart';
import 'package:pocketbook/views/home/add_edit_transaction/add_edit_transaction_view.dart';
import 'package:pocketbook/views/home/detail_transaction/detail_transaction_binding.dart';
import 'package:pocketbook/views/home/detail_transaction/detail_transaction_view.dart';
import 'package:pocketbook/views/home/home_binding.dart';
import 'package:pocketbook/views/home/home_view.dart';
import 'package:pocketbook/views/kid/history_kid/history_kid_binding.dart';
import 'package:pocketbook/views/kid/history_kid/history_kid_view.dart';
import 'package:pocketbook/views/kid/kid_binding.dart';
import 'package:pocketbook/views/kid/kid_view.dart';
import 'package:pocketbook/views/login/login_binding.dart';
import 'package:pocketbook/views/login/login_view.dart';
import 'package:pocketbook/views/main/main_binding.dart';
import 'package:pocketbook/views/main/main_view.dart';
import 'package:pocketbook/views/report/report_binding.dart';
import 'package:pocketbook/views/report/report_view.dart';
import 'package:pocketbook/views/setting/add_edit_category/add_edit_category_binding.dart';
import 'package:pocketbook/views/setting/add_edit_category/add_edit_category_view.dart';
import 'package:pocketbook/views/setting/category/category_binding.dart';
import 'package:pocketbook/views/setting/category/category_view.dart';
import 'package:pocketbook/views/setting/detail_category/detail_category_binding.dart';
import 'package:pocketbook/views/setting/detail_category/detail_category_view.dart';
import 'package:pocketbook/views/setting/setting_binding.dart';
import 'package:pocketbook/views/setting/setting_view.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.report,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: RoutesName.kid,
      page: () => const KidView(),
      binding: KidBinding(),
    ),
    GetPage(
      name: RoutesName.setting,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RoutesName.category,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: RoutesName.categoryDetail,
      page: () => const DetailCategoryView(),
      binding: DetailCategoryBinding(),
    ),
    GetPage(
      name: RoutesName.addEditCategory,
      page: () => const AddEditCategoryView(),
      binding: AddEditCategoryBinding(),
    ),
    GetPage(
      name: RoutesName.transactionDetail,
      page: () => const DetailTransactionView(),
      binding: DetailTransactionBinding(),
    ),
    GetPage(
      name: RoutesName.addEditTransaction,
      page: () => const AddEditTransactionView(),
      binding: AddEditTransactionBinding(),
    ),

    GetPage(
      name: RoutesName.historyKid,
      page: () => const HistoryKidView(),
      binding: HistoryKidBinding(),
    ),
  ];
}

class RoutesName {
  static const nestedNavHome = 1;
  static const nestedNavReport = 2;
  static const nestedNavKid = 4;
  static const nestedNavSetting = 5;

  static const String login = '/login';
  static const String main = '/main';
  static const String home = '/home';
  static const String report = '/report';
  static const String kid = '/kid';
  static const String setting = '/setting';
  static const String category = '/category';
  static const String categoryDetail = '/category-detail';
  static const String addEditCategory = '/add-edit-category';
  static const String transactionDetail = '/transaction-detail';
  static const String addEditTransaction = '/add-edit-transaction';
  static const String historyKid = '/history-kid';
}
