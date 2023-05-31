import '../../../core/config/Utils.dart';
import '../../../data/models/entities/booking.dart';
import '../../../data/models/entities/login_model.dart';
import '../../../data/models/requests/booking_request.dart';
import '../../../data/provider/provider_data.dart';
import '../../bloc/state_notifier.dart';

class ScheduleBloc extends StateNotifier {
  ScheduleBloc(this.loginUser);

  final LoginResponse loginUser;

  //
  late bool _isLoadingBookings;
  bool get isLoadingBookings => _isLoadingBookings;
  //
  late List<Booking> _bookings;
  List<Booking> get bookings => _bookings;

  late String _fechaSelected;
  String get fechaSelected => _fechaSelected;
  set fechaSelected(String v) {
    _fechaSelected = v;
    notifyListeners();
  }

  Future<void> init() async {
    _fechaSelected = MyUtils.formatDate(DateTime.now());
    _isLoadingBookings = false;
    _bookings = [];

    notifyListeners();

    final bookingsResponse = await getBookingsPickDate();
    if (!mounted) return;
    //
    //
  }

  //
  //
  //
  Future<List<Booking>> getBookingsPickDate({int? bookingState = 1}) async {
    _isLoadingBookings = true;
    _bookings = [];
    notifyListeners();
    try {
      GetBookingListRequest request = GetBookingListRequest(
        businessID: loginUser.userBusinessDto[0].businessId,
        personID: loginUser.personId,
        initialDate: _fechaSelected,
        finalDate: _fechaSelected,
        bookingStateID: bookingState,
      );
      _isLoadingBookings = false;

      notifyListeners();
      final response = await ProviderData.getBookingList(request);
      if (!mounted) return [];
      if (response.error != null) {
        error = response;
        notifyListeners();
        return [];
      }
      return response.data!;
    } catch (e) {
      setError(e.toString());
      return [];
    }
  }

  String? calculaDayString() {
    int v = MyUtils.calculateDifference(_fechaSelected);

    switch (v) {
      case -1:
        return 'Ayer';
      case 0:
        return 'Hoy';
      case 1:
        return 'Mañana';
      default:
    }
    return null;
  }
}
