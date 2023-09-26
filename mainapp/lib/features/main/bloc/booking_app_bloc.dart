import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_event.dart';
import 'package:ui_ux_pet/features/main/bloc/booking_app_state.dart';

import '../../authen/signin/repository/authen_repository.dart';

class BookingAppBloc extends Bloc<BookingAppEvent, BookingAppState> {
  BookingAppBloc({
    required AuthenRepository authenRepository,
  })  : _authenRepository = authenRepository,
        super(const BookingAppState()) {
    on<GetBookingAppState>(_onGetBookingAppState);
  }

  final AuthenRepository _authenRepository;

  Future<void> _onGetBookingAppState(
    GetBookingAppState event,
    Emitter<BookingAppState> emit,
  ) async {
    emit(state.copyWith(status: BookingAppStatus.loading));
    if (await _authenRepository.isLogin()) {
      emit(state.copyWith(status: BookingAppStatus.signIn));
    } else {
      emit(state.copyWith(status: BookingAppStatus.guest));
    }
  }
}
