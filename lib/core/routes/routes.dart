import 'package:flutter/material.dart';

import '../../presentation/pages/booking/booking_detail_page/booking_detail_page.dart';
import '../../presentation/pages/calendar/calendar_page.dart';
import '../../presentation/pages/invoice/new_invoice_free/invoice_free_page.dart';
import '../../presentation/pages/navigator/background_navigator.dart';
import '../../presentation/pages/share_token/share_token_page.dart';
import '../../presentation/pages/validate_partner/login/login_page.dart';
import '../../presentation/pages/validate_partner/splash/splash_page.dart';
import '../../presentation/pages/validate_partner/unallowed_company/unallowed_company_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    LoginPage.routeName: (context) => LoginPage.init(context),
    SplashPage.routeName: (context) => SplashPage.init(context),
    ShareTokenPage.routeName: (context) => ShareTokenPage.init(context),
    InvoiceFreePage.routeName: (context) => const InvoiceFreePage(),
    // AgendaDetails.routeName: (context) => const AgendaDetails(),
    // NavigationPage.routeName: (BuildContext context) => const NavigationPage(),
    BackGroundNavigator.routeName: (BuildContext context) =>
        const BackGroundNavigator(),

    BookingDetailPage.routeName: (BuildContext context) => BookingDetailPage(),
    // CreateScheduleStepOne.routeName: (BuildContext context) =>
    //     CreateScheduleStepOne(),
    // CreateScheduleStepTwo.routeName: (BuildContext context) =>
    //     CreateScheduleStepTwo(),
    // CreateScheduleStepThree.routeName: (BuildContext context) =>
    //     const CreateScheduleStepThree(),

    CalendarPage.routeName: (BuildContext context) => const CalendarPage(),
    // AgentPage.routeName: (BuildContext context) => const AgentPage(),

    UnallowedCompanyPage.routeName: (BuildContext context) =>
        UnallowedCompanyPage.init(context),
  };
}
