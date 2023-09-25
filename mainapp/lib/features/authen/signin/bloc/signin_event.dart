import 'package:equatable/equatable.dart';

sealed class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignInUsernameChanged extends SignInEvent {
  SignInUsernameChanged(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

final class SignInPasswordChanged extends SignInEvent {
  SignInPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

final class SignInSubmitted extends SignInEvent {
  SignInSubmitted();
}
