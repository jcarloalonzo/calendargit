import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/config/palette.dart';
import 'core/routes/routes.dart';
import 'data/models/entities/booking.dart';
import 'data/preferences/preferences_user.dart';
import 'presentation/bloc/agenda_bloc.dart';
import 'presentation/bloc/agent_bloc.dart';
import 'presentation/bloc/calendar_bloc.dart';
import 'presentation/bloc/home_bloc.dart';
import 'presentation/bloc/main_bloc.dart';
import 'presentation/bloc/schedule_bloc.dart';
import 'presentation/pages/validate_partner/login/login_page.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  final prefsUser = PreferencesUser();
  await prefsUser.initPrefs();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => MainBloc()..init(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomeBloc(),
      ),
      ChangeNotifierProvider(
        create: (_) => AgendaBloc(),
      ),
      ChangeNotifierProvider(create: (_) => AgentModelProvider()),
      ChangeNotifierProvider(create: (_) => CalendarBloc()),
      //
      //
      //
      ChangeNotifierProvider(
        create: (_) => ScheduleBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final prefsUser = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    // List<CalendarEventData<Event>> lista = <CalendarEventData<Event>>[]
    //   ..insertAll(0, data());

    return CalendarControllerProvider<Booking>(
      // return CalendarControllerProvider<Booking>(
      // controller: EventController<Event>()..addAll(lista),
      controller: EventController<Booking>(),
      child: MaterialApp(
        title: 'App Agenda',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'ES'), // Español, no country code
        ],
        locale: const Locale('es'),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xFFEFF3F6),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          ),
          timePickerTheme: TimePickerThemeData(
            backgroundColor: Palette.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              side: BorderSide(color: Colors.white, width: 4),
            ),
            dayPeriodBorderSide:
                const BorderSide(color: Colors.white, width: 4),
            dayPeriodColor: Colors.blueGrey.shade600,
            dayPeriodTextColor: Colors.white,
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              side: BorderSide(color: Colors.white, width: 4),
            ),
            hourMinuteTextStyle:
                const TextStyle(fontSize: 65, fontWeight: FontWeight.w600),
            dialHandColor: Palette.colorApp,
            dialTextColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? Colors.white
                    : Palette.colorApp),
            entryModeIconColor: Palette.colorApp,
          ),
        ),
        routes: getApplicationRoutes(),
        // initialRoute: (prefsUser.userLoginResponse != null)
        //     ? BackGroundNavigator.routeName
        //     : LoginPage.routeName,
        // initialRoute: (prefsUser.userLoginResponse != null)
        //     ? BackGroundNavigator.routeName
        //     : LicenseSpaPage.routeName,

        // initialRoute: SplashPage.routeName,
        initialRoute: LoginPage.routeName,
      ),
    );
  }
}
