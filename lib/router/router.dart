import 'package:cyberman/src/home/home.dart';
import 'package:cyberman/src/view_more/views/view_more_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/view_more',
        builder: (context, state) => const ViewMorePage(),
      ),
    ],
  );

  GoRouter get router => _router;
}
