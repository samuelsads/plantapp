import 'package:go_router/go_router.dart';
import 'package:plant_app/ui/pages/home/home_page.dart';
import 'package:plant_app/ui/pages/loading/loading_page.dart';
import 'package:plant_app/ui/pages/login/login_page.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: '/',
    name: LoadingPage.name,
    builder: (context, state) => const LoadingPage(),
  ),
  GoRoute(
    path: '/login',
    name: LoginPage.name,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home/:page',
    name: HomePage.name,
    builder: (context, state) {
      final pageId = int.parse(state.pathParameters["page"] ?? "0");
      return HomePage(pageId: pageId);
    },
  ),
]);
