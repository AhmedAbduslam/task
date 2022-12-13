import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/data/models/models.dart';
import 'package:task/resources/resources.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    Key? key,
    required this.homeWidgets,
    required this.currentPage,
    required this.onPressed,
  }) : super(key: key);

  final List<HomeNavigationData> homeWidgets;
  final int currentPage;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildItems(context),
        ),
      ),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    List<Widget> items = [];
    for (var i = 0; i < homeWidgets.length; i++) {
      if (i == homeWidgets.length / 2) {
        items.add(const Spacer());
      }
      final isActive = currentPage == i;

      items.add(
        Expanded(
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: isActive ? null : () => onPressed.call(i),
            child: Transform.scale(
              scale: isActive ? .9 : 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: isActive ? .9 : 1,
                    child: SvgPicture.asset(
                      homeWidgets.elementAt(i).icon,
                      color: isActive
                          ? ColorsResources.kPrimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Text(
                    homeWidgets.elementAt(i).lable,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return items;
  }
}
