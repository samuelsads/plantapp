import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Plants Page'),
        ),
      );
}
