import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../bloc/calendar_bloc.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer_menu.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';
import '../account/account_page.dart';
import '../calendar/calendar_page.dart';
import '../schedule/schedule_page.dart';
//

class BackGroundNavigator extends StatefulWidget {
  const BackGroundNavigator({
    Key? key,
    this.tituloAppBar,
    this.wgBody,
    this.pageActual,
  }) : super(key: key);
  static String routeName = '/backgroundNavigation';

  final String? tituloAppBar;
  final Widget? wgBody;
  final String? pageActual;

  @override
  _BackGroundNavigatorState createState() => _BackGroundNavigatorState();
}

class _BackGroundNavigatorState extends State<BackGroundNavigator> {
  bool isListening = false;

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  void setIndex(BuildContext c, int s) {
    // final scheduleLoading =
    //     Provider.of<ScheduleBloc>(context, listen: false).isLoading;
    // final homeLoading = Provider.of<HomeBloc>(context, listen: false).isLoading;
    final calendarLoading =
        Provider.of<CalendarBloc>(context, listen: false).isLoading;

    // if (!scheduleLoading && !homeLoading && !calendarLoading) {
    setState(() => _index = s);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final blocSchedule = Provider.of<ScheduleBloc>(context);
    final blocCalendar = Provider.of<CalendarBloc>(context);

    final List screens = [
      // const HomePage(),
      // HomePage(),
      SchedulePage.init(context),
      const CalendarPage(), // SchedulePage.init(context),
      AccountPage.init(context),

      // SchedulePage(),
      // HomePage(),
    ];
    return SafeArea(
      child: Scaffold(
          drawer: DrawerMenu(),
          appBar: buildAppBar(
            title: 'SALON',
            isDrawer: true,
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
          body: screens[_index]),
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
