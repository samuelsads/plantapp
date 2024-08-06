import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeProvider with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  set chagePage(int nextPage) {
    _currentPage = nextPage;
    _pageController.animateToPage(_currentPage,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    notifyListeners();
  }

  int get currentPage => _currentPage;

  set currentPage(int current) {
    _currentPage = current;
    notifyListeners();
  }
}
