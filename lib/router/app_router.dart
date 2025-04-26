import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:soapah/pages/account/account_page.dart';
import 'package:soapah/pages/account/change_password_page.dart';
import 'package:soapah/pages/calculator/add_additives_page.dart';
import 'package:soapah/pages/calculator/add_oils_page.dart';
import 'package:soapah/pages/calculator/additive_qualities_page.dart';
import 'package:soapah/pages/calculator/calculator_page.dart';
import 'package:soapah/pages/calculator/oil_qualities_page.dart';
import 'package:soapah/pages/calendar/calendar_page.dart';
import 'package:soapah/pages/coming_soon/coming_soon_page.dart';
import 'package:soapah/pages/date_details/date_details_page.dart';
import 'package:soapah/pages/home/home_page.dart';
import 'package:soapah/pages/login/login_page.dart';
import 'package:soapah/pages/monthly_pdf/monthly_pdf_page.dart';
import 'package:soapah/pages/signup/signup_page.dart';
import 'package:soapah/pages/weekly_pdf/weekly_pdf_page.dart';
import 'package:soapah/pages/welcome/welcome_page.dart';
import 'package:soapah/router/app_routes.dart';

import '../providers/auth_provider.dart';

class AppRouter {
  static final router = GoRouter(
    // initialLocation: AppRoutes.welcome,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(path: AppRoutes.login, builder: (context, state) => LoginPage()),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => SignupPage(),
      ),

      GuardedRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GuardedRoute(
        path: AppRoutes.calculator,
        builder: (context, state) => const CalculatorPage(),
      ),
      GuardedRoute(
        path: AppRoutes.addOils,
        builder: (context, state) => const AddOilsPage(),
      ),
      GuardedRoute(
        path: AppRoutes.oilQualities,
        builder: (context, state) => const OilQualitiesPage(),
      ),
      GuardedRoute(
        path: AppRoutes.addAdditives,
        builder: (context, state) => const AddAdditivesPage(),
      ),
      GuardedRoute(
        path: AppRoutes.additiveQualities,
        builder: (context, state) => const AdditiveQualitiesPage(),
      ),
      GuardedRoute(
        path: AppRoutes.calendar,
        builder: (context, state) => CalendarPage(),
      ),
      GuardedRoute(
        path: AppRoutes.dateDetails,
        builder: (context, state) => DateDetailsPage(),
      ),
      GuardedRoute(
        path: AppRoutes.weeklyPdf,
        builder: (context, state) => WeeklyPdfPage(),
      ),
      GuardedRoute(
        path: AppRoutes.monthlyPdf,
        builder: (context, state) => MonthlyPdfPage(),
      ),
      GuardedRoute(
        path: AppRoutes.account,
        builder: (context, state) => AccountPage(),
      ),
      GuardedRoute(
        path: AppRoutes.changePassword,
        builder: (context, state) => ChangePasswordPage(),
      ),
      GuardedRoute(
        path: AppRoutes.recipes,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.batch,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.inventory,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.soapahForum,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.userGuide,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.aboutUs,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
      GuardedRoute(
        path: AppRoutes.learningCenter,
        builder: (context, state) => ComingSoonPage(path: state.uri.path),
      ),
    ],
  );
}

class GuardedRoute extends GoRoute {
  GuardedRoute({
    required super.path,
    super.name,
    required super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.caseSensitive,
    super.onExit,
    super.routes,
  }) : super(
         redirect: (context, state) {
           final authenticated = context.read<AuthProvider>().authenticated;
           if (!authenticated) {
             return AppRoutes.welcome;
           }
           return null;
         },
       );
}
