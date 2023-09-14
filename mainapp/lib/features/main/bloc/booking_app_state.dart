import 'package:equatable/equatable.dart';

enum BookingAppStatus { loading, guest, signIn }

class BookingAppState extends Equatable {
  const BookingAppState({
    this.status = BookingAppStatus.loading,
  });

  final BookingAppStatus status;

  @override
  List<Object?> get props => [status];

  BookingAppState copyWith({
    BookingAppStatus? status,
  }) {
    return BookingAppState(
      status: status ?? this.status,
    );
  }
}
