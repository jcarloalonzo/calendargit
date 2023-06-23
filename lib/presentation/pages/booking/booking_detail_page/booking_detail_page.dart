// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/entities/booking.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import 'booking_detail_bloc.dart';
import 'booking_detail_body..dart';

class BookingDetailPage extends StatelessWidget {
  const BookingDetailPage._();
  static String routeName = '/BookingDetailPage';

  static Widget init(BuildContext context, Booking booking) {
    final loginUser = context.read<MainBloc>().login!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                BookingDetailBloc(loginUser, booking: booking)..init()),
      ],
      child: const BookingDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<BookingDetailBloc>();
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      titleAppBar: 'Detalles de la reserva',
      isLoading: bloc.isLoading,
      child: BookingDetailBody(),
    );
  }
}
