import 'package:formz/formz.dart';

enum PasswordInputError { empty }

class Password extends FormzInput<String, PasswordInputError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;
    return null;
  }
}
