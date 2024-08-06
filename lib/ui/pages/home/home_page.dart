import 'package:flutter/material.dart';
import 'package:plant_app/domain/providers/home/home_provider.dart';
import 'package:plant_app/ui/pages/home/page_view/page_view_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewPage(),
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
          context.read<HomeProvider>().chagePage = value;
        },
      ),
    );
  }
}
