import 'package:super_localizations/super_localizations.dart';

abstract class FirebaseErrors {
  static const kInvalidVerificationCode = "INVALID_VERIFICATION_CODE";
  static const kSessionExpired = "SESSION_EXPIRED";
  static const kMissingClientIdentifier = "MISSING_CLIENT_IDENTIFIER";
  static const kTooManyRequests = "TOO_MANY_REQUESTS";
  static const kInvalidCustomToken = "INVALID_CUSTOM_TOKEN";
  static const kCredentialMismatch = "CREDENTIAL_MISMATCH";
  static const kTokenExpired = "TOKEN_EXPIRED";
  static const kInvalidEmail = "INVALID_EMAIL";
  static const kUserDisabled = "USER_DISABLED";
  static const kUserNotFound = "USER_NOT_FOUND";
  static const kInvalidRefreshToken = "INVALID_REFRESH_TOKEN";
  static const kInvalidGrantType = "INVALID_GRANT_TYPE";
  static const kMissingRefreshToken = "MISSING_REFRESH_TOKEN";
  static const kEmailExists = "EMAIL_EXISTS";
  static const kEmailAlreadyInUse = "EMAIL_ALREADY_IN_USE";
  static const kOperationNotAllowed = "OPERATION_NOT_ALLOWED";
  static const kTooManyAttemptsTryLater = "TOO_MANY_ATTEMPTS_TRY_LATER";
  static const kEmailNotFound = "EMAIL_NOT_FOUND";
  static const kInvalidPassword = "INVALID_PASSWORD";
  static const kWrongPassword = "WRONG_PASSWORD";
  static const kInvalidIDPResponse = "INVALID_IDP_RESPONSE";
  static const kExpiredOOBCode = "EXPIRED_OOB_CODE";
  static const kInvalidOOBCode = "INVALID_OOB_CODE";
  static const kInvalidIDToken = "INVALID_ID_TOKEN";
  static const kWeakPassword = "WEAK_PASSWORD";
  static const kCredentialTooOldLoginAgain = "CREDENTIAL_TOO_OLD_LOGIN_AGAIN";
  static const kFederatedUserIDAlreadyLinked =
      "FEDERATED_USER_ID_ALREADY_LINKED";

  static String getMessage(message) {
    if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kTooManyRequests)) {
      return SuperTranslations.of.firebaseInvalidCustomToken;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidCustomToken)) {
      return SuperTranslations.of.firebaseInvalidCustomToken;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kCredentialMismatch)) {
      return SuperTranslations.of.firebaseCredentialMismatch;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidEmail)) {
      return SuperTranslations.of.firebaseInvalidEmail;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kTokenExpired)) {
      return SuperTranslations.of.firebaseTokenExpired;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kUserDisabled)) {
      return SuperTranslations.of.firebaseUserDisabled;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kUserNotFound)) {
      return SuperTranslations.of.firebaseUserNotFound;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidRefreshToken)) {
      return SuperTranslations.of.firebaseInvalidRefreshToken;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidGrantType)) {
      return SuperTranslations.of.firebaseInvalidGrantType;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kMissingRefreshToken)) {
      return SuperTranslations.of.firebaseMissingRefreshToken;
    } else if (message
            .toString()
            .toUpperCase()
            .replaceAll('-', '_')
            .contains(kEmailExists) ||
        message
            .toString()
            .toUpperCase()
            .replaceAll('-', '_')
            .contains(kEmailAlreadyInUse)) {
      return SuperTranslations.of.firebaseEmailExists;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kOperationNotAllowed)) {
      return SuperTranslations.of.firebaseOperationNotAllowed;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kTooManyAttemptsTryLater)) {
      return SuperTranslations.of.firebaseTooManyAttemptsTryLater;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kEmailNotFound)) {
      return SuperTranslations.of.firebaseEmailNotFound;
    } else if (message
            .toString()
            .toUpperCase()
            .replaceAll('-', '_')
            .contains(kInvalidPassword) ||
        message
            .toString()
            .toUpperCase()
            .replaceAll('-', '_')
            .contains(kWrongPassword)) {
      return SuperTranslations.of.firebaseInvalidPassword;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidIDPResponse)) {
      return SuperTranslations.of.firebaseInvalidIDPResponse;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kExpiredOOBCode)) {
      return SuperTranslations.of.firebaseExpiredOOBCode;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidOOBCode)) {
      return SuperTranslations.of.firebaseInvalidOOBCode;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kInvalidIDToken)) {
      return SuperTranslations.of.firebaseInvalidIDToken;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kWeakPassword)) {
      return SuperTranslations.of.firebaseWeakPassword;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kCredentialTooOldLoginAgain)) {
      return SuperTranslations.of.firebaseCredentialTooOldLoginAgain;
    } else if (message
        .toString()
        .toUpperCase()
        .replaceAll('-', '_')
        .contains(kFederatedUserIDAlreadyLinked)) {
      return SuperTranslations.of.firebaseFederatedUserIDAlreadyLinked;
    } else {
      return message.toString();
    }
  }
}
