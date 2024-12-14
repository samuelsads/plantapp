import 'package:flutter/material.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});
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
