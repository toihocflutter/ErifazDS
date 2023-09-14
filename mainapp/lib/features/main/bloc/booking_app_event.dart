import 'package:equatable/equatable.dart';

sealed class BookingAppEvent extends Equatable {
  const BookingAppEvent();

  @override
  List<Object> get props => [];
}

final class GetBookingAppState extends BookingAppEvent {
  const GetBookingAppState();
}
