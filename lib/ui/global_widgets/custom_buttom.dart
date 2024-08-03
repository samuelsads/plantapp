import 'package:flutter/material.dart';

class CumstomButtom extends StatefulWidget {
  const CumstomButtom(
      {this.left = 24,
      this.right = 24,
      this.top = 24,
      this.bottom = 0,
      required this.title,
      required this.onPressed,
      super.key});
  final Function()? onPressed;
  final String title;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  @override
  State<CumstomButtom> createState() => _CumstomButtomState();
}

class _CumstomButtomState extends State<CumstomButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            onPressed: widget.onPressed, child: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 16),)));
  }
}
