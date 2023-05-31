// import '../../../core/config/Utils.dart';
// import '../../../data/models/entities/home_model.dart';
// import '../../../data/models/entities/login_model.dart';
// import '../../../data/provider/provider_data.dart';
// import '../../bloc/state_notifier.dart';

// class HomeBloc extends StateNotifier {
//   HomeBloc(this.loginUser);

//   //
//   //
//   final LoginResponse loginUser;
//   //

//   late List<BookingHome> _bookings;
//   List<BookingHome> get bookings => _bookings;

//   Future<void> init() async {
//     //
//     //
//     //
//     _bookings = await getBookingHome();
//     if (!mounted) return;
//   }

//   Future<List<BookingHome>> getBookingHome() async {
//     try {
//       isLoading = true;
//       final response = await ProviderData.getBookingHome(
//           businessID: loginUser.userBusinessDto[0].businessId!,
//           personID: loginUser.personId,
//           date: MyUtils.formatDate(DateTime.now()));
//       isLoading = false;

//       if (!mounted) return [];
//       if (response.error != null) {
//         error = response;
//         notifyListeners();
//         return [];
//       }
//       return response.data!;
//     } catch (e) {
//       setError(e.toString());
//       return [];
//     }
//   }
// }
