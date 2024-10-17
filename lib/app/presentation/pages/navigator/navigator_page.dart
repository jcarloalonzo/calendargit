import 'package:flutter/material.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../generated/translations.g.dart';
import '../../widgets/my_background.dart';
import 'account/account_page.dart';
import 'calendar/calendar_page.dart';
import 'home/home_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});
  static String route = '/NavigatorPage';

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final List<Widget> _screens = [
    const HomePage(),
    const CalendarPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MyBackGround(
      isAppBar: true,
      isDrawer: true,
      bottomNavigatorBar: NavigationBar(
        onDestinationSelected: updateIndex,
        selectedIndex: index,
        animationDuration: const Duration(seconds: 2),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        indicatorColor: const Color(0xffD7CDF8),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        destinations: [
          _CustomNavigationDestination(
            label: texts.label.home,
            icon: Icons.home,
          ),
          _CustomNavigationDestination(
            label: texts.label.calendar,
            icon: Icons.calendar_month,
          ),
          _CustomNavigationDestination(
            label: texts.label.account,
            icon: Icons.person,
          ),
        ],
      ),
      // bottomNavigator: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.call),
      //       label: 'Calls',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.camera),
      //       label: 'Camera',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chats',
      //     ),
      //   ],
      // ),
      child: _screens[index],
    );
  }

  void updateIndex(int value) {
    index = value;
    setState(() {});
  }
}

class _CustomNavigationDestination extends StatelessWidget {
  const _CustomNavigationDestination(
      // ignore: unused_element
      {required this.label,
      required this.icon,
      // ignore: unused_element
      this.sizeSvg = 20});

  final String label;
  final IconData icon;
  final double sizeSvg;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(icon, color: Palette.colorApp),
      label: label,
    );
  }
}
