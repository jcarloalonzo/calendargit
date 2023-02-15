// import 'package:calendario/presentation/pages/agent/agent_2_page_2.dart';
// import 'package:calendario/presentation/pages/calendary/calendary_page.dart';
// import 'package:calendario/presentation/pages/home/home_page.dart';
// import 'package:calendario/presentation/pages/liquidation/liquidation_page.dart';
// import 'package:flutter/material.dart';

// class NavigationPage extends StatefulWidget {
//   static String routeName = "/NavigationPage";

//   const NavigationPage({Key? key}) : super(key: key);

//   @override
//   _NavigationPageState createState() => _NavigationPageState();
// }

// class _NavigationPageState extends State<NavigationPage> {
//   // final List<Widget> _screens = [
//   //   HomePage.init(context),
//   //   const BookingsPage(),
//   //   const Scaffold(),
//   // ];

//   int _selectedIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     void onTabTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }

//     final List<Widget> _screens = [
//       const HomePage(),
//       // AgentPage.init(context),
//       const AgentPage(),

//       LiquidationPage.init(context),
//       // CalendaryPage(),
//       const CalendaryPage(), // SchedulePage.init(context),
//     ];
//     return DefaultTabController(
//       length: 3,
//       child: SafeArea(
//         child: WillPopScope(
//           onWillPop: () async {
//             return false;
//           },
//           child: Scaffold(
//             body: _screens[_selectedIndex],
//             bottomNavigationBar: BottomNavigationBar(
//               onTap: onTabTapped, //
//               type: BottomNavigationBarType.fixed,
//               currentIndex: _selectedIndex, // new

//               showSelectedLabels: true,
//               // ignore: prefer_const_literals_to_create_immutables
//               items: [
//                 // ignore: prefer_const_constructors
//                 BottomNavigationBarItem(
//                   icon: const Icon(Icons.home),
//                   label: ('Home'),
//                 ),
//                 // ignore: prefer_const_constructors
//                 BottomNavigationBarItem(
//                   icon: const Icon(Icons.book_outlined),
//                   label: 'Agenda',
//                 ),
//                 // ignore: prefer_const_constructors
//                 BottomNavigationBarItem(
//                   icon: const Icon(Icons.request_page_outlined),
//                   label: ('Liquidación'),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: const Icon(Icons.schedule),
//                   label: ('Horario'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
