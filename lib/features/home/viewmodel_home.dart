import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewmodelHome {
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go("/home/0");
        break;
      case 1:
        context.go("/home/1");
        break;
      case 2:
        context.go("/home/2");
        break;
      default:
        context.go("/home/0");
    }
  }
}
