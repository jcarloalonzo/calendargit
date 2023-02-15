import 'package:calendario/presentation/pages/agent/agent_cancel/agent_cancel_page.dart';
import 'package:calendario/presentation/pages/agent/agent_complet/agent_complete_page.dart';
import 'package:calendario/presentation/pages/agent/agent_invoice/agent_invoice_one_page.dart';
import 'package:calendario/presentation/pages/agent/agent_invoice/agent_invoice_two_page.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_detail_page.dart';
import 'package:calendario/presentation/pages/agent/agent_reprogramming/agent_repro_page.dart';
import 'package:calendario/presentation/pages/agent/schedule_reservation_free/schedule_reservationfree_page.dart';
import 'package:calendario/presentation/pages/booking/booking_detail_page/booking_detail_page.dart';
import 'package:calendario/presentation/pages/calendar/calendar_page.dart';
import 'package:calendario/presentation/pages/invoice/new_invoice_free/invoice_free_page.dart';
import 'package:calendario/presentation/pages/license/license_spa_page.dart';
import 'package:calendario/presentation/pages/navigator/background_navigator.dart';
import 'package:calendario/presentation/pages/validate_partner/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/pages/validate_partner/login/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    LoginPage.routeName: (context) => LoginPage.init(context),
    SplashPage.routeName: (context) => SplashPage.init(context),
    AgentReproPage.routeName: (context) => const AgentReproPage(),
    InvoiceFreePage.routeName: (context) => InvoiceFreePage(),
    // AgendaDetails.routeName: (context) => const AgendaDetails(),
    // NavigationPage.routeName: (BuildContext context) => const NavigationPage(),
    BackGroundNavigator.routeName: (BuildContext context) =>
        const BackGroundNavigator(),
    AgentReproDetailPage.routeName: (BuildContext context) =>
        const AgentReproDetailPage(),
    AgentCancelDetailPage.routeName: (BuildContext context) =>
        AgentCancelDetailPage(),
    AgentCompletePage.routeName: (BuildContext context) =>
        const AgentCompletePage(),
    AgentInvoiceOnePage.routeName: (BuildContext context) =>
        const AgentInvoiceOnePage(),
    AgentInvoiceTwoPage.routeName: (BuildContext context) =>
        const AgentInvoiceTwoPage(),
    BookingDetailPage.routeName: (BuildContext context) => BookingDetailPage(),
    // CreateScheduleStepOne.routeName: (BuildContext context) =>
    //     CreateScheduleStepOne(),
    // CreateScheduleStepTwo.routeName: (BuildContext context) =>
    //     CreateScheduleStepTwo(),
    // CreateScheduleStepThree.routeName: (BuildContext context) =>
    //     const CreateScheduleStepThree(),

    LicenseSpaPage.routeName: (context) => LicenseSpaPage.init(context),

    CalendarPage.routeName: (BuildContext context) => const CalendarPage(),
    // AgentPage.routeName: (BuildContext context) => const AgentPage(),
    ScheduleReservationFreePage.routeName: (BuildContext context) =>
        ScheduleReservationFreePage.init(context),
  };
}
