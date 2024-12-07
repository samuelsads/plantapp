import 'package:go_router/go_router.dart';
import 'package:plant_app/features/authentication/presentation/pages/login_page.dart';
import 'package:plant_app/features/home/home_page.dart';
import 'package:plant_app/features/loading/loading_page.dart';

///
final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: LoadingPage.path,
    name: LoadingPage.pathName,
    builder: (context, state) => const LoadingPage(),
  ),
  GoRoute(
    path: LoginPage.path,
    name: LoginPage.pathName,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home/:page',
    name: HomePage.name,
    builder: (context, state) {
      final pageId = int.parse(state.pathParameters['page'] ?? '0');
      return HomePage(pageId: pageId);
    },
  ),
]);
