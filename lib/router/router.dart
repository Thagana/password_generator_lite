import 'package:cyberman/src/home/home.dart';
import 'package:cyberman/src/passwords/views/password_page.dart';
import 'package:cyberman/src/root/drawer_navigation.dart';
import 'package:cyberman/src/settings/views/settings_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return DrawerNavigation(
            child: child,
          );
        },
        branches: <StatefulShellBranch>[
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
    ],
  );

  GoRouter get router => _router;
}
