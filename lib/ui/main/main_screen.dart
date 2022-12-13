import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app_strings/en.dart';
import 'package:task/data/models/models.dart';
import 'package:task/resources/resources.dart';
import 'package:task/ui/controllers.dart';
import 'package:task/ui/screens.dart';
import 'package:task/ui/widgets.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<HomeNavigationData> homeWidgets = List.unmodifiable([
      HomeNavigationData(
        icon: AssetsResources.home,
        lable: kGrocery,
        screen: const HomeScreen(),
      ),
      HomeNavigationData(
        icon: AssetsResources.notifications,
        lable: kNews,
        screen: const HomeScreen(),
      ),
      HomeNavigationData(
        icon: AssetsResources.favs,
        lable: kFavorites,
        screen: const HomeScreen(),
      ),
      HomeNavigationData(
        icon: AssetsResources.cart,
        lable: kCart,
        screen: const HomeScreen(),
      ),
    ]);

    return ColoredSafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: controller.pageController,
          physics: StyleResources.scrollPhysics,
          onPageChanged: controller.onPageChanged,
          children: homeWidgets.map((e) => e.screen).toList(),
        ),
        bottomNavigationBar: Obx(
          () => MainBottomNavigationBar(
            homeWidgets: homeWidgets,
            currentPage: controller.currentPage.value,
            onPressed: controller.changePage,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsResources.kPrimaryColor,
        ),
      ),
    );
  }
}
