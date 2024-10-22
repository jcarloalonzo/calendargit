import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/helpers/helpers.dart';
import '../../../../dependency_injection.dart';
import '../../../../generated/translations.g.dart';
import '../../../domain/models/booking.dart';
import '../../blocs/booking_generate_invoice/booking_generate_invoice_bloc.dart';
import '../../blocs/booking_generate_invoice/booking_generate_invoice_state.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/my_background.dart';
import 'booking_generate_invoice_body.dart';

class BookingGenerateInvoicePage extends StatelessWidget {
  const BookingGenerateInvoicePage({super.key, required this.booking});
  static String route = '/BookingGenerateInvoicePage';
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<BookingGenerateInvoiceBloc>()..init(booking: booking),
      child: const _Screen(),
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingGenerateInvoiceBloc,
        BookingGenerateInvoiceState>(
      listener: (context, state) {
        state.mapOrNull(loaded: (_) async {
          if (_.error == null) return;
          await Helpers.showErrorPopupState(context,
              error: _.error,
              cleanErrorCallback:
                  context.read<BookingGenerateInvoiceBloc>().cleanError);
        });
      },
      builder: (context, state) {
        return MyBackGround(
          isAppBar: true,
          titleAppBar: texts.label.generateInvoice,
          // child: BookingGenerateInvoiceBody(),
          child: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => BookingGenerateInvoiceBody(
              model: model,
            ),
          ),
        );
      },
    );
  }
}
