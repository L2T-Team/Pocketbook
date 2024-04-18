import 'package:get/get.dart';
import 'package:pocketbook/language/en.dart';
import 'package:pocketbook/utils/app_constant.dart';

class LanguageKey {
  /// Common
  static const error = 'error';
  static const errorOverImage10Mb = 'errorOverImage10Mb';

  // Login
  static const login = 'login';
  static const username = 'user_name';
  static const password = 'password';
  static const welcomeBack = 'welcome_back';
  static const noUserFound = 'noUserFound';
  static const wrongPassword = 'wrong_password';
  static const yes = 'Yes';
  static const no = 'No';
  static const ok = 'OK';
  static const requestPermission = 'request_permission';
  static const requestCameraPermission = 'request_camera_permissiom';
  static const requestPhotoPermission = 'request_photo_permission';

  // Bottom bar
  static const home = 'home';
  static const report = 'report';
  static const kid = 'kid';
  static const setting = 'setting';

  // Home
  static const total = 'total';
  static const transaction = 'transaction';
  static const deleteTransaction = 'delete_transaction';
  static const deleteTransactionDescription = 'delete_transaction_description';
  static const transactionDetail = 'Transaction_detail';
  static const amount = 'amount';
  static const date = 'date';
  static const editTransaction = 'edit_transaction';
  static const addNewTransaction = 'add_new_transaction';
  static const more = 'more';
  static const transactionName = 'transaction_name';

  // Report
  static const day = 'day';
  static const month = 'month';
  static const year = 'year';
  static const period = 'period';
  static const overview = 'overview';

  // Kid
  static const captureKidCare = 'capture_kid_care';
  static const mon = 'mon';
  static const tue = 'tue';
  static const wed = 'wed';
  static const thu = 'thu';
  static const fri = 'fri';
  static const sat = 'sat';
  static const sun = 'sun';
  static const history = 'history';
  static const viewAll = 'view_all';
  static const babyVisitConfirm = 'Baby visit confirmation';
  static const confirmYourVisit = 'Confirming your visit with love';
  static const yesSure = 'yes_sure';

  // Setting
  static const category = 'category';
  static const logOut = 'log_out';
  static const logOutDescription = 'logOutDescription';
  static const cancel = 'cancel';
  static const yesLogOut = 'yes_log_out';
  static const expense = 'expense';
  static const income = 'income';
  static const createNew = 'create_new';
  static const categoryDetail = 'category_detail';
  static const name = 'name';
  static const type = 'type';
  static const delete = 'delete';
  static const edit = 'edit';
  static const deleteCategory = 'delete_category';
  static const deleteCategoryDescription = 'delete_category_description';
  static const deleteKidDay = 'delete_kid_day';
  static const deleteKidDayDescription = 'delete_kid_day_description';
  static const editNewCategory = 'edit_new_category';
  static const updatePhoto = 'update_photo';
  static const addNewCategory = 'add_new_category';
  static const save = 'save';
  static const addImage = 'add_image';
  static const change = 'change';
  static const takePhoto = 'take_photo';
  static const chooseFromLibrary = 'choose_from_library';

  // Message error
  static const emailInvalid = 'email_invalid';
  static const passwordInvalid = 'password_invalid';
  static const anErrorOccured = 'an_error_occured';
  static const invalidAccess = 'your_access_is_invalid';
  static const expiredAccess = 'your_access_is_expired';
  static const badInternetConnection = 'network_error';
  static const somethingWentWrong = 'something_went_wrong';
  static const enterPassword = 'enter_password';
  static const reEnterPassword = 're_enter_password';

  // Error
  static const defaultApiError = 'default_api_error';
  static const apiTimeoutError = 'api_timeout_error';
  static const apiCancelError = 'api_cancel_error';
  static const apiOtherError = 'api_other_error';
  static const errorCallNotSupport = 'error_call_not_support';
  static const errorPopupNoticeFail = 'error_popup_notice_fail';

  /// Register
  static const register = 'register';
  static const emailRegisterTitle = 'email_register_title';
  static const emailRegisterDescription = 'email_register_description';
  static const passwordRegisterDescription = 'password_register_description';
  static const emailRegister = 'email_register';
  static const emalRegisterPlaceHolder = 'email_register_place_holder';
  static const passwordRegister = 'password_register';
  static const minCharacters = 'min_characters';
  static const passwordValid = 'password_valid';
  static const passwordErrorSameEmail = 'password_error_same_email';
  static const passwordIncludeSymbols = 'password_include_symbols';
  static const messagePolicy = 'message_policy';
  static const termsOfService = 'terms_of_service';
  static const privacyPolicy = 'privacy_policy';
  static const titleDialogRegister = 'title_dialog_register';
  static const contentDialogRegister = 'content_dialog_register';
  static const newRegister = 'new_register';
  static const emailRegisterError = 'email_register_error';
  static const emailInvalidError = 'emailInvalidError';
  static const emailMatchError = 'emailMatchError';
  static const emailExistTitle = 'email_exist_title';

  /// Error Code
  static const code203 = 'Non-authoritative Information';
  static const code204 = 'No Content';
  static const code205 = 'Reset Content';
  static const code206 = 'Partial Content';
  static const code400 = 'Bad Request';
  static const code401 = 'Unauthorized';
  static const code402 = 'Payment Required';
  static const code403 = 'Forbidden';
  static const code404 = 'Not Found';
  static const code405 = 'Method Not Allowed';
  static const code406 = 'Not Acceptable';
  static const code407 = 'Proxy Authentication Required';
  static const code408 = 'Request Timeout';
  static const code409 = 'Conflict';
  static const code500 = 'Internal Server Error';
  static const code501 = 'Not Implemented';
  static const code502 = 'Bad Gateway';
  static const code503 = 'Service Unavailable';
  static const code504 = 'Gateway Timeout';
  static const code505 = 'HTTP Version Not Supported';
}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        LocaleKey.en: EnglishLanguage().generateLanguage(),
      };
}
