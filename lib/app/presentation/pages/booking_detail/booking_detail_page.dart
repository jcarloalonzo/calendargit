import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/helpers/helpers.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../domain/models/booking.dart';
import '../../blocs/booking_detail/booking_detail_bloc.dart';
import '../../blocs/booking_detail/booking_detail_state.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/my_background.dart';
import 'booking_detail_body.dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage({super.key, required this.booking});
  static String route = '/BookingDetailPage';
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BookingDetailBloc>()..init(booking: booking),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingDetailBloc, BookingDetailState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback: context.read<BookingDetailBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          isAppBar: true,
          // child: BookingDetailBody(),
          titleAppBar: texts.label.bookingDetails,
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => BookingDetailBody(booking: model.booking),
          ),
        );
      },
    );
  }
}
