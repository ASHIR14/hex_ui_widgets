import 'package:flutter/material.dart';

import 'bottom_nav_outline.dart';

class FitBottomNavBar extends StatefulWidget {
  const FitBottomNavBar(
      {required this.selectedTab,
      required this.icons,
      this.height,
      this.primaryColor,
      this.secondaryColor,
      this.selectedIconColor,
      this.unselectedIconColor,
      this.iconSize,
      this.hideCenterOutline = false,
      this.iconsVerticalPosition,
      super.key});

  final int selectedTab;
  final double? height;
  final Color? primaryColor;
  final Color? secondaryColor;
  final List<Widget> icons;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final double? iconSize;
  final bool hideCenterOutline;
  final double? iconsVerticalPosition;

  @override
  State<FitBottomNavBar> createState() => _FitBottomNavBarState();
}

class _FitBottomNavBarState extends State<FitBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.height ?? 82) + 10,
      child: Stack(
        children: [
          BottomNavOutline(
            selectedTab: widget.selectedTab,
            height: widget.height,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
            hideCenterOutline: widget.hideCenterOutline,
          ),
          Positioned(
            top: widget.iconsVerticalPosition ?? 50,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.icons,
            ),
          ),
        ],
      ),
    );
  }
}
