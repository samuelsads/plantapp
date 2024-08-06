import 'package:flutter/material.dart';

class PlantsPage extends StatefulWidget {
  static const name = "plants-page";
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Plants Page"),
      ),
    );
  }
}
