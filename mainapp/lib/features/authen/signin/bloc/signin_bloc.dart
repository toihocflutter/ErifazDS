import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_event.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_state.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/authen_repository.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/models/models.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthenRepository authenRepository})
      : _authenRepository = authenRepository,
        super(const SignInState()) {
    on<SignInUsernameChanged>(_onSignInUsernameChanged);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
    on<SignInSubmitted>(_onSignInSummited);
  }

  final AuthenRepository _authenRepository;

  Future<void> _onSignInUsernameChanged(
      SignInUsernameChanged event, Emitter<SignInState> emit) async {
    final userName = Username.dirty(event.username);
    emit(state.copyWith(
        username: userName,
        isValid: Formz.validate([userName, state.password])));
  }

  Future<void> _onSignInPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) async {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, password])));
  }

  Future<void> _onSignInSummited(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    await _authenRepository.signIn(
        userName: state.username.value, password: state.password.value);
  }
}
