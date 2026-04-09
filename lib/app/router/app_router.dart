import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'route_guards.dart';
import 'route_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RouteNames.signIn,
      redirect: (context, state) => RouteGuards.guestGuard(),
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: RouteNames.signUp,
      redirect: (context, state) => RouteGuards.guestGuard(),
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: RouteNames.dashboard,
      redirect: (context, state) => RouteGuards.authGuard(),
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);