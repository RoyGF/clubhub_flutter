import 'package:clubhub/presentation/detail/detail_screen.dart';
import 'package:clubhub/presentation/home/home_screen.dart';
import 'package:clubhub/presentation/search/search_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';

  static const search = '/search';

  static const detail = '/detail';

  static final router = GoRouter(
    routes: [
      GoRoute(
        name: home,
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: search,
        path: search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: detail,
        path: '$detail/:id',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailScreen(personId: state.pathParameters['id']!),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
