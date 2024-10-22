import 'package:go_router/go_router.dart';

import '../../app/domain/models/booking.dart';
import '../../app/domain/models/worker.dart';
import '../../app/presentation/blocs/authentication/create_company/categories_subscription/screen_model/categories_subscription_screen_model.dart';
import '../../app/presentation/blocs/authentication/create_company/request_company/screen_model/request_company_screen_model.dart';
import '../../app/presentation/blocs/authentication/create_company/request_login/screen_model/request_login_screen_model.dart';
import '../../app/presentation/blocs/authentication/create_company/request_office/screen_model/request_office_screen_model.dart';
import '../../app/presentation/blocs/reschedule_booking/screen_model/reschedule_booking_screen_model.dart';
import '../../app/presentation/blocs/workers/new_worker/new_worker_step_one/screen_model/new_worker_step_one_screen_model.dart';
import '../../app/presentation/pages/authentication/create_company/categories_subscription/categories_subscription_page.dart';
import '../../app/presentation/pages/authentication/create_company/request_company/request_company_page.dart';
import '../../app/presentation/pages/authentication/create_company/request_login/request_login_page.dart';
import '../../app/presentation/pages/authentication/create_company/request_office/request_office_page.dart';
import '../../app/presentation/pages/authentication/create_company/services_subscription/services_subscription_page.dart';
import '../../app/presentation/pages/authentication/login/login_page.dart';
import '../../app/presentation/pages/authentication/register/register_page.dart';
import '../../app/presentation/pages/authentication/token/token_page.dart';
import '../../app/presentation/pages/authentication/unallowed_company/unallowed_company_page.dart';
import '../../app/presentation/pages/booking_detail/booking_detail_page.dart';
import '../../app/presentation/pages/booking_generate_invoice/booking_generate_invoice_page.dart';
import '../../app/presentation/pages/navigator/navigator_page.dart';
import '../../app/presentation/pages/reschedule_booking/reschedule_booking_page.dart';
import '../../app/presentation/pages/reschedule_confirmation/reschedule_confirmation_page.dart';
import '../../app/presentation/pages/share_token/share_token_page.dart';
import '../../app/presentation/pages/splash/splash_page.dart';
import '../../app/presentation/pages/workers/home/workers_page.dart';
import '../../app/presentation/pages/workers/new_worker/set_services_worker/set_services_worker_page.dart';
import '../../app/presentation/pages/workers/new_worker/step_one/new_worker_step_one_page.dart';
import '../../app/presentation/pages/workers/new_worker/step_two/new_worker_step_two_page.dart';
import '../../app/presentation/pages/workers/worker_detail/worker_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: TokenPage.route,
      builder: (context, state) => const TokenPage(),
    ),
    GoRoute(
      path: UnallowedCompanyPage.route,
      builder: (context, state) => const UnallowedCompanyPage(),
    ),
    GoRoute(
        path: CategoriesSubscriptionPage.route,
        builder: (context, state) {
          final data = state.extra as RequestLoginScreenModel;
          return CategoriesSubscriptionPage(stepModel: data);
        }),
    GoRoute(
      path: RequestCompanyPage.route,
      builder: (context, state) => const RequestCompanyPage(),
    ),
    GoRoute(
        path: RequestLoginPage.route,
        builder: (context, state) {
          final data = state.extra as RequestOfficeScreenModel;
          return RequestLoginPage(stepModel: data);
        }),
    GoRoute(
        path: RequestOfficePage.route,
        builder: (context, state) {
          final data = state.extra as RequestCompanyScreenModel;
          return RequestOfficePage(stepModel: data);
        }),
    GoRoute(
      path: ServicesSubscriptionPage.route,
      builder: (context, state) {
        final data = state.extra as CategoriesSubscriptionScreenModel;
        return ServicesSubscriptionPage(stepModel: data);
      },
    ),
    GoRoute(
      path: RegisterPage.route,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: ShareTokenPage.route,
      builder: (context, state) => const ShareTokenPage(),
    ),
    GoRoute(
      path: LoginPage.route,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: NavigatorPage.route,
      builder: (context, state) => const NavigatorPage(),
    ),
    GoRoute(
      path: WorkersPage.route,
      builder: (context, state) => const WorkersPage(),
    ),
    GoRoute(
      path: NewWorkerStepOnePage.route,
      builder: (context, state) => const NewWorkerStepOnePage(),
    ),
    GoRoute(
        path: NewWorkerStepTwoPage.route,
        builder: (context, state) {
          final data = state.extra as NewWorkerStepOneScreenModel;
          return NewWorkerStepTwoPage(stepModel: data);
        }),
    GoRoute(
      path: SetServicesWorkerPage.route,
      builder: (context, state) {
        final data = state.extra as int;
        return SetServicesWorkerPage(personId: data);
      },
    ),
    GoRoute(
      path: WorkerDetailPage.route,
      builder: (context, state) {
        final data = state.extra as Worker;
        return WorkerDetailPage(worker: data);
      },
    ),
    GoRoute(
      path: BookingDetailPage.route,
      builder: (context, state) {
        final data = state.extra as Booking;
        return BookingDetailPage(booking: data);
      },
    ),
    GoRoute(
        path: RescheduleBookingPage.route,
        builder: (context, state) {
          final data = state.extra as Booking;
          return RescheduleBookingPage(booking: data);
        }),
    GoRoute(
        path: RescheduleConfirmationPage.route,
        builder: (context, state) {
          final data = state.extra as RescheduleBookingScreenModel;
          return RescheduleConfirmationPage(stepModel: data);
        }),
    GoRoute(
        path: BookingGenerateInvoicePage.route,
        builder: (context, state) {
          final data = state.extra as Booking;
          return BookingGenerateInvoicePage(booking: data);
        }),
  ],
);
