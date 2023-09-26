import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/models/models.dart';

class SignInState extends Equatable {
  const SignInState(
      {this.status = FormzSubmissionStatus.initial,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.isValid = false});

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;

  SignInState copyWith(
      {FormzSubmissionStatus? status,
      Username? username,
      Password? password,
      bool? isValid}) {
    return SignInState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid);
  }

  @override
  List<Object?> get props => [status, username, password];
}
