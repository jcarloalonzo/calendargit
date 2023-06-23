import '../../../../data/models/entities/anula_booking_request.dart';
import '../../../../data/models/entities/booking.dart';
import '../../../../data/models/entities/complete_booking_request.dart';
import '../../../../data/models/entities/login_model.dart';
import '../../../../data/provider/provider_data.dart';
import '../../../bloc/state_notifier.dart';

class BookingDetailBloc extends StateNotifier {
  BookingDetailBloc(this.loginUser, {required this.booking});

  final LoginResponse loginUser;

//
  final Booking booking;
  //
  late bool _isLoadingBookings;
  bool get isLoadingBookings => _isLoadingBookings;
  //

  Future<void> init() async {
    //
  }

  //

  Future<bool> anulateBooking({required String reason}) async {
    try {
      AnulaBookingRequest obj = AnulaBookingRequest(
        bookingId: booking.bookingId,
        user: loginUser.userId,
        businessId: loginUser.userBusinessDto[0].businessId,
        businessIdent: loginUser.userBusinessDto[0].identification,
        reason: '',
      );
      final response = await ProviderData.anulateBooking(obj);

      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  Future<bool> completeBooking() async {
    try {
      CompleteBookingRequest request = CompleteBookingRequest(
        authorizedUser: 0,
        bookingId: booking.bookingId,
        businessId: loginUser.userBusinessDto[0].businessId,
        businessIdent: loginUser.userBusinessDto[0].identification,
        officeId: loginUser.userBusinessDto[0].officeId,
      );
      final response = await ProviderData.completeBooking(request);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  Future<bool> validateToReprogram() async {
    try {
      final response =
          await ProviderData.validateToReprogram(booking.bookingId!);
      if (response.error != null) {
        error = response;
        notifyListeners();
        return false;
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return false;
    }
  }

  //
  // //
  // Future<List<Booking>> getBookingsPickDate({int? bookingState = 1}) async {
  //   _isLoadingBookings = true;
  //   _bookings = [];
  //   notifyListeners();
  //   try {
  //     GetBookingListRequest request = GetBookingListRequest(
  //       businessID: loginUser.userBusinessDto[0].businessId,
  //       personID: loginUser.personId,
  //       initialDate: _fechaSelected,
  //       finalDate: _fechaSelected,
  //       bookingStateID: bookingState,
  //     );
  //     _isLoadingBookings = false;

  //     notifyListeners();
  //     final response = await ProviderData.getBookingList(request);
  //     if (!mounted) return [];
  //     if (response.error != null) {
  //       error = response;
  //       notifyListeners();
  //       return [];
  //     }

  //     return response.data!;
  //   } catch (e) {
  //     setError(e.toString());
  //     return [];
  //   }
  // }

  // Future<void> getBookingDate() async {
  //   try {
  //     final List<Booking> bookingsResponse = await getBookingsPickDate();
  //     if (!mounted) return;
  //     _bookings = bookingsResponse; //
  //     notifyListeners();
  //   } catch (e) {
  //     setError(e.toString());
  //   }
  // }
}
