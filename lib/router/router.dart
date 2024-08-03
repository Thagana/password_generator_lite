import 'package:cyberman/src/features/home/views/home.dart';
import 'package:cyberman/src/features/login/views/login_page.dart';
import 'package:cyberman/src/features/onbaording/blocs/onboarding_bloc.dart';
import 'package:cyberman/src/features/onbaording/index.dart';
import 'package:cyberman/src/features/passwords/passwords.dart';
import 'package:cyberman/src/features/settings/views/settings_page.dart';
import 'package:cyberman/src/root/drawer_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return DrawerNavigation(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/passwords',
                builder: (context, state) => const PasswordsPages(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const Onboarding(),
      ),
    ],
    redirect: (context, state) {
      final loggedIn = FirebaseAuth.instance.currentUser != null;
      final onboardingState = context.watch<OnboardingBloc>().state;

      print('Onboarding State: ${onboardingState} logged in: ${loggedIn}');

      if (loggedIn) {
        if (!onboardingState.isDone) {
          return '/onboarding';
        }
        if (state.fullPath == '/' && !onboardingState.isDone) {
          return '/onboarding';
        }
        if (state.fullPath == '/login') {
          return '/';
        }
        return null;
      }
      if (!loggedIn && state.fullPath != '/login') {
        return '/login';
      }
      return null;
    },
  );

  static GoRouter get router => _router;
}
