import 'package:flutter/material.dart';
import 'package:plant_app/domain/providers/home/home_provider.dart';
import 'package:plant_app/ui/pages/home/viewmodel_home.dart';
import 'package:plant_app/ui/pages/plants/plants_page.dart';
import 'package:plant_app/ui/pages/prices/prices_page.dart';
import 'package:plant_app/ui/pages/profile/profile_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const name = 'home-page';
  final int pageId;
  const HomePage({required this.pageId, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const routes = <Widget>[PlantsPage(), PricesPage(), ProfilePage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.pageId,
        children: routes,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_florist), label: "Plantas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.price_change), label: "Precios"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
        enableFeedback: false,
        useLegacyColorScheme: true,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedFontSize: 14,
        currentIndex: context.watch<HomeProvider>().currentPage,
        elevation: 0,
        onTap: (value) {
          ViewmodelHome().onItemTapped(context, value);
          context.read<HomeProvider>().currentPage = value;
        },
      ),
    );
  }
}
