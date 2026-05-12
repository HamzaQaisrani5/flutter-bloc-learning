import 'package:fl_bloc/home_page.dart';
import 'package:fl_bloc/inc_dec_button.dart';
import 'package:fl_bloc/routing/route_names.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: RouteNames.homePage,
    routes: [
      GoRoute(
        path: RouteNames.homePage,
        name: RouteNames.homePage,
        builder: (context, state) => MyHomePage(title: 'LOYA PHAR'),
      ),

      GoRoute(
        path: RouteNames.incdecButton,
        name: RouteNames.incdecButton,
        builder: (context, state) => IncDecButton(),
      ),
    ],
  );
}
