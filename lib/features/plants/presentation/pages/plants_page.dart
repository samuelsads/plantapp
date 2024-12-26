import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/features/plants/presentation/pages/add_plant_page.dart';

/// [PlantsPage] is the page that displays the plants.
class PlantsPage extends StatefulWidget {
  /// [PlantsPage] is the page that displays the plants.
  const PlantsPage({super.key});

  /// [name] is the name of the page.
  static const name = 'plants-page';

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: const Center(
          child: Text('Plants Page'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async => await context.pushNamed(AddPlantPage.pathName),
        ),
      );
}
