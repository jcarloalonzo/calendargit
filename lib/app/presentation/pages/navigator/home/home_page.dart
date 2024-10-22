import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/general/bookings/bookings_bloc.dart';
import '../../../blocs/general/bookings/bookings_state.dart';
import '../../../widgets/error_screen.dart';
import '../../../widgets/loading_screen.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return _Screen();
  }
}

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        return Scaffold(
          body: state.when(
            loading: () => const LoadingScreen(),
            failed: (_) => ErrorScreen(
              text: _,
              onRetry: () {},
            ),
            loaded: (_, model) => HomeBody(model: model),
          ),
        );
      },
    );
  }
}
