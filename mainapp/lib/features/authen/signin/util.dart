import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/models/models.dart';

class SignInUtil {
  static String? getErrorMessageUserName(
      NameInputError? error, AppLocalizations appLocalizations) {
    switch (error) {
      case NameInputError.empty:
        return appLocalizations.user_name_cannot_be_empty;
      default:
        return null;
    }
  }

  static String? getErrorMessagePassword(
      PasswordInputError? error, AppLocalizations appLocalizations) {
    switch (error) {
      case PasswordInputError.empty:
        return appLocalizations.password_cannot_be_empty;
      default:
        return null;
    }
  }
}
