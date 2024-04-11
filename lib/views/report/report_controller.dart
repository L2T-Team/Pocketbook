import 'package:get/get.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:pocketbook/model/responses/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbook/repos/auth_repo.dart';

class ReportController extends GetxController {
  AuthRepo authRepo;
  SharedPreferences sharedPreferences;

  ReportController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  final Rx<String> selectedTime = Rx<String>(LanguageKey.day.tr);
  final Rx<DateTime> currentDate = Rx<DateTime>(DateTime.now());
  final Rx<double> income = Rx<double>(300000.70);
  final Rx<double> expense = Rx<double>(400000.33);
  final Rx<List<CategoryModel>> listCategories = Rx<List<CategoryModel>>([
    CategoryModel(
      name: 'Car',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Beauty',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Travel',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Shopping',
      type: LanguageKey.expense.tr,
    ),
    CategoryModel(
      name: 'Health',
      type: LanguageKey.expense.tr,
    ),
  ]);
  final Rx<List<TransactionModel>> listTransactions =
      Rx<List<TransactionModel>>([
        TransactionModel(
      id: '08',
      name: 'Van',
      amount: 9000,
      date: '04/11/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Expense',
      ),
    ),
    TransactionModel(
      id: '07',
      name: 'Bao',
      amount: 9000,
      date: '04/11/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Income',
      ),
    ),
    TransactionModel(
      id: '1',
      name: 'Lam',
      amount: 5000,
      date: '04/09/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Expense',
      ),
    ),
    TransactionModel(
      id: '2',
      name: 'Le',
      amount: 6000,
      date: '04/10/2024',
      category: CategoryModel(
        name: 'Beauty',
        type: 'Expense',
      ),
    ),
    TransactionModel(
      id: '3',
      name: 'Huu',
      amount: 4000,
      date: '04/08/2024',
      category: CategoryModel(
        name: 'Car',
        type: 'Income',
      ),
    ),
    TransactionModel(
      id: '4',
      name: 'HHH',
      amount: 3300,
      date: '04/10/2024',
      category: CategoryModel(
        name: 'Car',
        type: 'Icome',
      ),
    ),
  ]);

  /// Init
  @override
  void onInit() {
    super.onInit();
  }

  /// Next Date
  void nextDateAction() {
    if (selectedTime.value == LanguageKey.day.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 1));
    } else if (selectedTime.value == LanguageKey.month.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 30));
    } else if (selectedTime.value == LanguageKey.year.tr) {
      currentDate.value = currentDate.value.add(const Duration(days: 365));
    }
  }

  /// Previous Date
  void previousDateAction() {
    if (selectedTime.value == LanguageKey.day.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 1));
    } else if (selectedTime.value == LanguageKey.month.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 30));
    } else if (selectedTime.value == LanguageKey.year.tr) {
      currentDate.value = currentDate.value.subtract(const Duration(days: 365));
    }
  }
}
