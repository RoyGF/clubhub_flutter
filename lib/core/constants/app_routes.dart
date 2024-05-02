import 'package:clubhub/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';

  static const search = '/search';

  static const detail = '/detail';

  static final router = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //   path: search,
    //   builder: (context, state) => SearchWidget(),
    // ),
    // GoRoute(
    //   path: detail,
    //   builder: (context, state) {
    //     final id = state.params['id'];
    //     return DetailWidget(id: id);
    //   },
    // ),
  ]);
}
