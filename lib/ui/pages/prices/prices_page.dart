import 'package:flutter/material.dart';

class PricesPage extends StatefulWidget {
  static const name = "prices-page";
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Prices Page"),
      ),
    );
  }
}
