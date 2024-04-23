import 'package:pocketbook/language/language.dart';

class ChineseLanguage {
  Map<String, String> generateLanguage() {
    return {
      // Login
      LanguageKey.errorOverImage10Mb:
      'The image size exceeds 10MB\nUnable to upload\nPlease upload under 10MB',
      LanguageKey.login: 'Login',
      LanguageKey.username: 'Username',
      LanguageKey.password: 'Password',
      LanguageKey.welcomeBack: '老婆大人好！',
      LanguageKey.noUserFound: 'No user found for that email.',
      LanguageKey.wrongPassword:
      'You have entered an invalid username or password',
      LanguageKey.yes: 'Yes',
      LanguageKey.yesDelete: '没毛病',
      LanguageKey.no: 'No',
      LanguageKey.ok: 'OK',
      LanguageKey.requestPermission: 'An error has occurred',
      LanguageKey.requestCameraPermission:
      'Requires access to camera. Go to app settings and enable permissions',
      LanguageKey.requestPhotoPermission:
      'Requires access to gallery. Go to app settings and enable permissions',

      // Bottom Bar
      LanguageKey.homeNav: 'Home',
      LanguageKey.reportNav: 'Report',
      LanguageKey.kidNav: 'Kid',
      LanguageKey.settingNav: 'Me',

      // Home
      LanguageKey.total: 'Total balance',
      LanguageKey.transaction: 'Transaction',
      LanguageKey.deleteTransaction: 'Delete transaction',
      LanguageKey.deleteTransactionDescription:
      'Are you sure you want to delete\nthis transaction?',
      LanguageKey.amount: 'Amount',
      LanguageKey.date: 'Date',
      LanguageKey.transactionDetail: 'Transaction detail',
      LanguageKey.editTransaction: 'Edit transaction',
      LanguageKey.addNewTransaction: 'Add new transaction',
      LanguageKey.more: 'More',
      LanguageKey.transactionName: 'Transaction name',

      // Report
      LanguageKey.day: 'Day',
      LanguageKey.month: 'Month',
      LanguageKey.year: 'Year',
      LanguageKey.period: 'Period',
      LanguageKey.overview: 'Overview',

      // Kid
      LanguageKey.captureKidCare: '让我看看我带了几天娃',
      LanguageKey.sun: 'Sun',
      LanguageKey.mon: 'Mon',
      LanguageKey.tue: 'Tue',
      LanguageKey.thu: 'Thu',
      LanguageKey.fri: 'Fri',
      LanguageKey.sat: 'Sat',
      LanguageKey.wed: 'Wed',
      LanguageKey.history: 'History',
      LanguageKey.viewAll: 'View All',
      LanguageKey.babyVisitConfirm: '今天带娃了',
      LanguageKey.confirmYourVisit: '看清楚了昂',
      LanguageKey.yesSure: '没毛病',
      LanguageKey.kid: '神兽在家的一天',

      // Setting
      LanguageKey.category: 'Category',
      LanguageKey.logOut: 'Log out',
      LanguageKey.logOutDescription: 'Log out from app?',
      LanguageKey.cancel: '等等！',
      LanguageKey.yesLogOut: 'Yes, log out',
      LanguageKey.expense: 'Expense',
      LanguageKey.income: 'Income',
      LanguageKey.createNew: 'Create new',
      LanguageKey.categoryDetail: 'Category detail',
      LanguageKey.name: 'Name',
      LanguageKey.type: 'Type',
      LanguageKey.delete: 'Delete',
      LanguageKey.edit: 'Edit',
      LanguageKey.deleteCategory: 'Delete category',
      LanguageKey.deleteCategoryDescription:
      'Are you sure you want to delete\nthis category?',
      LanguageKey.deleteKidDay: '删了删了',
      LanguageKey.deleteKidDayDescription:
      '你确定今天没带娃？',
      LanguageKey.editNewCategory: 'Edit new category',
      LanguageKey.updatePhoto: 'Update photo',
      LanguageKey.addNewCategory: 'Add new category',
      LanguageKey.save: '这笔记下了！',
      LanguageKey.addImage: 'Add image',
      LanguageKey.change: 'Change',
      LanguageKey.takePhoto: 'Take photo',
      LanguageKey.chooseFromLibrary: 'Choose from library',

      // Message Error
      LanguageKey.emailInvalid: 'Email Invalid',
      LanguageKey.passwordInvalid: 'Password Invalid',
      LanguageKey.anErrorOccurred: 'An error occurred',
      LanguageKey.invalidAccess: 'Your access is invalid',
      LanguageKey.expiredAccess: 'Your access is expired, please login again',
      LanguageKey.badInternetConnection: 'Network error',
      LanguageKey.somethingWentWrong: 'Something went wrong, please try again.',
      LanguageKey.enterPassword: 'Enter Password',
      LanguageKey.reEnterPassword: ' Re-enter Password for confirmation',

      // Error
      LanguageKey.defaultApiError: 'Data error, please try again later',
      LanguageKey.apiTimeoutError: 'Connection timeout, please try again later',
      LanguageKey.apiCancelError: 'Connection canceled, please try again later',
      LanguageKey.apiOtherError: 'Other error, please try again later',
      LanguageKey.errorCallNotSupport:
      'Calling is not supported over the web. Open in mobile or web view',
      LanguageKey.errorPopupNoticeFail: 'Cannot load popup',

      /// Register
      LanguageKey.register: 'Register',
      LanguageKey.emailRegister: 'Email Address',
      LanguageKey.emalRegisterPlaceHolder: 'mail@mymedi.jp',
      LanguageKey.passwordValid: '8 or more single-byte alphanumeric symbols',
      LanguageKey.passwordRegister: 'Password',
      LanguageKey.passwordErrorSameEmail:
      'You cannot use the same character string as the email',
      LanguageKey.passwordIncludeSymbols:
      'Please include symbols such as @ and -',
      LanguageKey.minCharacters: '8 single-byte characters',
      LanguageKey.messagePolicy:
      'I agree to the terms of use and privacy policy',
      LanguageKey.termsOfService: 'terms of use',
      LanguageKey.privacyPolicy: 'privacy policy',
      LanguageKey.contentDialogRegister:
      'An email has been\n sent to your municipal email address\n@email\nPlease access the link in the email within NN hours to complete your account registration',
      LanguageKey.titleDialogRegister:
      'Please check the mailbox for your registered email address.',

      /// Error
      LanguageKey.error: 'Message',

      /// Error Code
      LanguageKey.code203: 'Non-authoritative Information',
      LanguageKey.code204: 'No Content',
      LanguageKey.code205: 'Reset Content',
      LanguageKey.code206: 'Partial Content',
      LanguageKey.code400: 'Bad Request',
      LanguageKey.code401: 'Unauthorized',
      LanguageKey.code402: 'Payment Required',
      LanguageKey.code403: 'Forbidden',
      LanguageKey.code404: 'Not Found',
      LanguageKey.code405: 'Method Not Allowed',
      LanguageKey.code406: 'Not Acceptable',
      LanguageKey.code407: 'Proxy Authentication Required',
      LanguageKey.code408: 'Request Timeout',
      LanguageKey.code409: 'Conflict',
      LanguageKey.code500: 'Internal Server Error',
      LanguageKey.code501: 'Not Implemented',
      LanguageKey.code502: 'Bad Gateway',
      LanguageKey.code503: 'Service Unavailable',
      LanguageKey.code504: 'Gateway Timeout',
      LanguageKey.code505: 'HTTP Version Not Supported',
    };
  }
}
