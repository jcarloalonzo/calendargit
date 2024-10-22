import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    @JsonKey(name: 'BookingID') required int bookingId,
    @JsonKey(name: 'BookingCode') required String bookingCode,
    @JsonKey(name: 'ServiceID') required int serviceId,
    @JsonKey(name: 'ServiceDescription') required String serviceDescription,
    @JsonKey(name: 'Date') required DateTime date,
    @JsonKey(name: 'InitialTime') required String initialTime,
    @JsonKey(name: 'FinalTime') required String finalTime,
    @JsonKey(name: 'BookingStateID') required int bookingStateId,
    @JsonKey(name: 'BookingState') required String bookingState,
    @JsonKey(name: 'Observation') required String observation,
    @JsonKey(name: 'DocumentTypeID') required String documentTypeId,
    @JsonKey(name: 'Identification') required dynamic identification,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'EmailAddress') required dynamic emailAddress,
    @JsonKey(name: 'UserCodeUI') required String userCodeUi,
    @JsonKey(name: 'price') required num price,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
