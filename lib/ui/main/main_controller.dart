import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/resources/resources.dart';

class MainController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  void changePage(int page) {
    if (page == currentPage.value) return;
    if ((page - currentPage.value).abs() > 1) {
      pageController.jumpToPage(page);
    } else {
      pageController.animateToPage(
        page,
        duration: StyleResources.baseDuration,
        curve: StyleResources.baseCurve,
      );
    }
  }

  void onPageChanged(int page) => currentPage(page);
}
