import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_event.dart';
import 'package:ui_ux_pet/features/authen/signin/bloc/signin_state.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/authen_repository.dart';

class SignInBlock extends Bloc<SignInEvent, SignInState> {
  SignInBlock({required AuthenRepository authenRepository})
      : _authenRepository = authenRepository,
        super(const SignInState()) {
    on<SignInUsernameChanged>(_onSignInUsernameChanged);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
    on<SignInSubmitted>(_onSignInSummited);
  }

  final AuthenRepository _authenRepository;

  Future<void> _onSignInUsernameChanged(
      SignInUsernameChanged event, Emitter<SignInState> emit) async {}

  Future<void> _onSignInPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) async {}

  Future<void> _onSignInSummited(
      SignInSubmitted event, Emitter<SignInState> emit) async {}
}
