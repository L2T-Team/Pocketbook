enum BookType { firstVisit, reExamination }

enum ThirdPartyType { navigate, google, outlook, icloud, deleteBooking }

enum ReservationActionType { create, update, delete }

enum StatusAppointmentUI {
  unknown,
  moreThanOneHour,
  lessThanOneHour,
  lessThan30Min,
  lessThan15Min
}

enum QuestionnaireState { inProcess, done }

enum ActionRequiredJoinRoomType { insuranceCard, submitDoc }

enum VideoCallState {
  initialize,
  waiting,
  prepare,
  executive,
  disconnect,
  end,
}

enum ChangePasswordType {
  register,
  changePassword,
  resetPassword,
}

enum VerifyCodeType {
  basicInfo,
  signUp,
  resetPassword,
  changeEmail,
  changePassword
}

enum InviteCodeType { signup, loginWithoutAccount }

enum AppFlavor { staging, prod }

enum ReservationType {
  hospital('hospital'),
  pharmacy('pharmacy');

  final String code;

  const ReservationType(this.code);
}

enum NotiType {
  hospital('hospital'),
  pharmacy('pharmacy'),
  management('management'),
  reservationComplete('reservation_complete');

  final String key;
  const NotiType(this.key);
}

enum FileExtension { pdf, png, jpg, heic, heif, jpeg }

enum InsuranceScreenState { inSummary, inDetail }

enum ReservationTypeData { hospital, pharmacy }

enum TapDocumentPickerOption { file, gallery, photo }

enum PractitionerType {
  doctor('doctor'),
  pharmacist('pharmacist');

  final String code;

  const PractitionerType(this.code);
}

enum NotificationType { patient, system }

enum NotificationActionEnter { inapp, outside }

enum FileTypePicker { pdf, image, camera }

enum SuccessNotificationType { registerSuccess, changedEmailSuccess }

enum SubmitDocumentActionType { add, update, delete, none }

enum SubmitStatus { remote, local }

enum ZipCodeErrorType {
  errZipcodeInvalidParams('ErrZipcodeInvalidParams', 1),
  errZipcodeSystem('ErrZipcodeSystem', 2),
  errZipcodeMaintenance('ErrZipcodeMaintenance', 3),
  errZipcodeNoResult('ErrZipcodeNoResult', 4),
  errMaxExceedLimit('ErrMaxExceedLimit', 5),
  errOther('ErrOther', 6);

  final String codeMsg;
  final int code;
  const ZipCodeErrorType(this.codeMsg, this.code);
}

enum AnswerType {
  draft,
  complete,
}

enum SendingAnswer {
  previous,
  next,
}

enum CardFieldType {
  cardNo,
  expiredDate,
  cvv,
}

enum StateConfirmBookingTimeUI {
  unknown,
  bookingTimeMoreThan60Mins,
  bookingTimeLessThan60Mins,
  bookingTimeInvalid,
}
