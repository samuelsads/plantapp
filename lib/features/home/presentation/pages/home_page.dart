import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/features/home/presentation/cubits/navigator/navigator_cubit.dart'
    as cubit;
import 'package:plant_app/features/plants/presentation/pages/plants_page.dart';
import 'package:plant_app/features/prices/prices_page.dart';
import 'package:plant_app/features/profile/profile_page.dart';

/// [HomePage]   is a page that is displayed
class HomePage extends StatefulWidget {
  /// [HomePage]   is a page that is displayed
  const HomePage({required this.pageId, super.key});

  /// [name] is the name of the page.
  static const path = '/home-page/:page';

  /// [pathName] is the name of the page.
  static const pathName = 'home-page';

  ///[page id] represent the position page
  final int pageId;

  @override
  State<HomePage> createState() => _HomePageState();
}

/// [pageController] is a controller that is used to navigate between pages.
late PageController _pageController;

/// [routes] is a list of pages that are displayed in the bottom navigation bar.
const routes = <Widget>[PlantsPage(), PricesPage(), ProfilePage()];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageId);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider.value(
          value: serviceLocator<cubit.NavigatorCubit>(),
          child: BlocBuilder<cubit.NavigatorCubit, cubit.NavigatorState>(
            builder: (context, state) => IndexedStack(
              index: widget.pageId,
              children: routes,
            ),
          ),
        ),
        bottomNavigationBar: BlocProvider.value(
          value: serviceLocator<cubit.NavigatorCubit>(),
          child: BlocBuilder<cubit.NavigatorCubit, cubit.NavigatorState>(
            builder: (context, state) => BottomNavigationBar(
              backgroundColor: Colors.green,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_florist), label: 'Plantas'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.price_change), label: 'Precios'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Perfil'),
              ],
              enableFeedback: false,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              elevation: 0,
              currentIndex: widget.pageId,
              onTap: (value) async {
                await context
                    .read<cubit.NavigatorCubit>()
                    .navigateToPage(value);

                // ignore: use_build_context_synchronously
                context.goNamed(HomePage.pathName,
                    pathParameters: {'page': value.toString()});
              },
            ),
          ),
        ),
      );
}
