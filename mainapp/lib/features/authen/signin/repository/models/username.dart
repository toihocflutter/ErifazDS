import 'package:formz/formz.dart';

enum NameInputError { empty }

class Username extends FormzInput<String, NameInputError> {
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  @override
  NameInputError? validator(String value) {
    if (value.isEmpty) return NameInputError.empty;
    return null;
  }
}
