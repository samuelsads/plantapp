import 'package:flutter/material.dart';

/// [PricesPage] is the page that displays the prices.
class PricesPage extends StatefulWidget {
  /// [PricesPage] is the page that displays the prices.
  const PricesPage({super.key});

  /// [PricesPage] is the page that displays the prices.
  static const name = 'prices-page';

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Prices Page'),
        ),
      );
}
