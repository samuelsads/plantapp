import 'package:flutter/material.dart';
import 'package:plant_app/domain/providers/home/home_provider.dart';
import 'package:plant_app/ui/pages/plants/plants_page.dart';
import 'package:plant_app/ui/pages/prices/prices_page.dart';
import 'package:plant_app/ui/pages/profile/profile_page.dart';
import 'package:provider/provider.dart';

class PageViewPage extends StatelessWidget {
  PageViewPage({super.key});

  List<Widget> items = [
    const PlantsPage(),
    const PricesPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      controller: context.watch<HomeProvider>().pageController,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}
