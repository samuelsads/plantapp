import 'package:flutter/material.dart';
import 'package:plant_app/domain/providers/home/home_provider.dart';
import 'package:plant_app/features/home/viewmodel_home.dart';
import 'package:plant_app/features/plants/plants_page.dart';
import 'package:plant_app/features/prices/prices_page.dart';
import 'package:plant_app/features/profile/profile_page.dart';
import 'package:provider/provider.dart';

/// [HomePage]   is a page that is displayed
class HomePage extends StatefulWidget {
  /// [HomePage]   is a page that is displayed
  const HomePage({required this.pageId, super.key});

  /// [name] is the name of the page.
  static const path = '/home-page/:page';

  /// [pathName] is the name of the page.
  static const pathName = 'home-page';

  final int pageId;

  @override
  State<HomePage> createState() => _HomePageState();
}

/// [routes] is a list of pages that are displayed in the bottom navigation bar.
const routes = <Widget>[PlantsPage(), PricesPage(), ProfilePage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: widget.pageId,
          children: routes,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_florist), label: 'Plantas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.price_change), label: 'Precios'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
          enableFeedback: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          onTap: (value) {
            ViewmodelHome().onItemTapped(context, value);
            context.read<HomeProvider>().currentPage = value;
          },
        ),
      );
}
