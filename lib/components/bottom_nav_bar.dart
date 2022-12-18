import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTapped,
    required this.items,
  }) : super(key: key);

  final int selectedIndex;
  final Color selectedColor;
  final Color unselectedColor;
  final Function(int) onTapped;
  final List<Icon> items;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      height: 90.0,
      // margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(40.0),
        //   topRight: Radius.circular(40.0),
        // ),
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, -1),
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 1,
          ),
          BoxShadow(
            offset: const Offset(2, 0),
            color: Colors.grey.shade300,
            blurRadius: 10.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < items.length; i++)
              IconButton(
                icon: items[i],
                iconSize: 35.0,
                color: selectedIndex == i ? selectedColor : unselectedColor,
                onPressed: () {
                  onTapped(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
