import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/bloc/calendar_bloc.dart';
import 'package:calendario/presentation/bloc/home_bloc.dart';
import 'package:calendario/presentation/bloc/schedule_bloc.dart';
import 'package:calendario/presentation/pages/account/acccount_page.dart';
import 'package:calendario/presentation/pages/calendar/calendar_methods.dart';
import 'package:calendario/presentation/pages/calendar/calendar_page.dart';
import 'package:calendario/presentation/pages/schedule/schedule_methods.dart';
import 'package:calendario/presentation/pages/schedule/schedule_page.dart';
import 'package:calendario/presentation/widgets/appbar.dart';
import 'package:calendario/presentation/widgets/drawer_menu.dart';
import 'package:calendario/presentation/widgets/my_alerts.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//

class BackGroundNavigator extends StatefulWidget {
  static String routeName = "/backgroundNavigation";

  final String? tituloAppBar;
  final Widget? wgBody;
  final String? pageActual;

  const BackGroundNavigator({
    this.tituloAppBar,
    this.wgBody,
    this.pageActual,
  });

  @override
  _BackGroundNavigatorState createState() => _BackGroundNavigatorState();
}

class _BackGroundNavigatorState extends State<BackGroundNavigator> {
  bool isListening = false;

  final List _screens = [
    // const HomePage(),
    // HomePage(),
    const SchedulePage(),
    const CalendarPage(), // SchedulePage.init(context),

    const AccountPage(),

    // SchedulePage(),
    // HomePage(),
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  void setIndex(BuildContext c, int s) {
    final scheduleLoading =
        Provider.of<ScheduleBloc>(context, listen: false).isLoading;
    final homeLoading = Provider.of<HomeBloc>(context, listen: false).isLoading;
    final calendarLoading =
        Provider.of<CalendarBloc>(context, listen: false).isLoading;

    if (!scheduleLoading && !homeLoading && !calendarLoading) {
      setState(() => _index = s);
    }
  }

  @override
  Widget build(BuildContext context) {
    final blocSchedule = Provider.of<ScheduleBloc>(context);
    final blocCalendar = Provider.of<CalendarBloc>(context);
    return SafeArea(
      child: Scaffold(
          drawer: DrawerMenu(),
          appBar: buildAppBar(
            title: 'SALON',
            isDrawer: true,
            actions: [
              if (_index == 0 || _index == 1)
                // if (_index == 1)

                IconButton(
                  icon: const Icon(Icons.info_outline),
                  color: Palette.white,
                  onPressed: () async =>
                      await ScheduleMethods.infoMethod(context),
                ),
              if (_index == 0 || _index == 1)
                // if (_index == 1)
                IconButton(
                  icon: const Icon(Icons.filter_list_outlined),
                  color: Palette.white,
                  onPressed: () async {
                    if (_index == 0) {
                      Provider.of<ScheduleBloc>(context, listen: false)
                          .initFilter();

                      final action =
                          await ScheduleMethods.filterMethodSchedule(context);
                      if (action == DialogsAlerts.yes) {
                        await blocSchedule.getBookingsPickDate(
                            bookingState:
                                blocSchedule.typeStateBookingDropDown.cod);
                      }
                    } else if (_index == 1) {
                      Provider.of<CalendarBloc>(context, listen: false)
                          .initFilter();

                      final action =
                          await CalendarMethods.filterMethodSchedule(context);
                      if (action == DialogsAlerts.yes) {
                        await blocCalendar.getBookings(
                            context: context,
                            bookingState:
                                blocCalendar.typeStateBookingDropDown.cod);
                      }
                    }
                  },
                ),
            ],
          ),
          backgroundColor: Palette.backgroundColor,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, spreadRadius: 2),
              ],
            ),
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            height: 70,
            width: double.infinity,
            child: Row(
              children: [
                // _IconBottomBar(
                //   index: 0,
                //   titulo: 'Home',
                //   icono: Icons.home,
                //   onTap: () {
                //     setIndex(context, 0);
                //   },
                //   currentIndex: _index,
                // ),
                _IconBottomBar(
                  index: 0,
                  titulo: 'Home',
                  icono: Icons.calendar_month,
                  currentIndex: _index,
                  onTap: () {
                    setIndex(context, 0);
                  },
                ),
                _IconBottomBar(
                  index: 1,
                  titulo: 'Calendario',
                  icono: Icons.calendar_today,
                  currentIndex: _index,
                  onTap: () {
                    setIndex(context, 1);
                  },
                ),
                _IconBottomBar(
                  index: 2,
                  titulo: 'Cuenta',
                  icono: Icons.person,
                  currentIndex: _index,
                  onTap: () {
                    setIndex(context, 2);
                  },
                ),
              ],
            ),
          ),

          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          body: _screens[_index]),
    );
  }
}

class _IconBottomBar extends StatelessWidget {
  const _IconBottomBar({
    required this.index,
    required this.titulo,
    this.icono,
    this.onTap,
    required this.currentIndex,
  });

  final String titulo;
  final int index;
  final int currentIndex;
  final IconData? icono;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              size: 21,
              color: (currentIndex == index) ? Palette.colorApp : Palette.gray7,
            ),
            const MySizedBoxHeight(kDouble: 3),
            MyText(
              text: titulo,
              size: 13,
              color: (currentIndex == index) ? Palette.colorApp : Palette.gray7,
            ),
          ],
        ),
      ),
    );
  }
}
