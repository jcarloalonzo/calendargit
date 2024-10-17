import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../config/routes/app_router.dart';
import '../dependency_injection.dart';
import 'domain/models/booking.dart';
import 'presentation/blocs/general/session/session_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SessionBloc>()),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CalendarControllerProvider<Booking>(
          controller: EventController<Booking>(),
          child: MaterialApp.router(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(0.9),
              ),
              child: child!,
            ),
            theme: ThemeData(
                useMaterial3: true,
                iconTheme: IconThemeData(color: Colors.white)),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Distribuidor',
            routerConfig: appRouter,
          ),
        ),
      ),
    );
  }
}
