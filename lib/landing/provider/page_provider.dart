import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'about', 'pricing', 'contact'];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  int getPageIndex(String routeName) {
    final index = _pages.indexOf(routeName);
    return index == -1 ? 0 : index;
  }

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(_onPageChanged);
    });
  }

  void _onPageChanged() {
    final index = (scrollController.page ?? 0).round();
    if (index != _currentIndex) {
      html.window.history.pushState(null, '', '/${_pages[index]}');
      _currentIndex = index;
      notifyListeners(); // Notifica a los oyentes sobre el cambio
    }
  }

  void goTo(int index) {
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  String get pageName => _pages[currentIndex];
}
