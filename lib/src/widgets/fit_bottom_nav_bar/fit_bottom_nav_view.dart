import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import 'fit_bottom_nav_bar.dart';

class FitBottomNavView extends StatefulWidget {
  const FitBottomNavView(
      {required this.screens,
      required this.initialTab,
      required this.icons,
      this.height,
      this.primaryColor,
      this.secondaryColor,
      this.selectedIconColor,
      this.unselectedIconColor,
      this.iconSize,
      this.hideCenterOutline = false,
      this.backgroundColor,
      super.key});

  /// The screens to be displayed when a tab is selected.
  /// The length of this list must match the length of [icons] i.e. 5.
  final List<Widget> screens;

  /// The initial tab to be selected when the app is first loaded.
  final int initialTab;

  /// The height of the bottom navigation bar, width is automatically adjusted.
  final double? height;

  /// The primary color of the bottom navigation bar.
  final Color? primaryColor;

  /// The secondary color of the bottom navigation bar.
  final Color? secondaryColor;

  /// The icons to be displayed in the bottom navigation bar.
  /// The length of this list must match the length of [screens] i.e. 5.
  final List<IconData> icons;

  /// The color of the icon when it is selected.
  final Color? selectedIconColor;

  /// The color of the icon when it is not selected.
  final Color? unselectedIconColor;

  /// The size of the icon.
  final double? iconSize;

  /// Whether to hide the outline of the center icon.
  final bool hideCenterOutline;

  /// The background color of the screens.
  final Color? backgroundColor;

  @override
  State<FitBottomNavView> createState() => _FitBottomNavViewState();
}

class _FitBottomNavViewState extends State<FitBottomNavView> {
  late int selectedTab;

  @override
  void initState() {
    selectedTab = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      bottomNavigationBar: FitBottomNavBar(
        selectedTab: selectedTab,
        height: widget.height,
        primaryColor: widget.primaryColor,
        secondaryColor: widget.secondaryColor,
        icons: widget.icons
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = widget.icons.indexOf(e);
                    });
                  },
                  child: Container(
                    decoration: selectedTab == widget.icons.indexOf(e)
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (widget.selectedIconColor ??
                                        AppColors.primary500)
                                    .withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 10,
                              ),
                            ],
                          )
                        : null,
                    child: Icon(
                      e,
                      color: selectedTab == widget.icons.indexOf(e)
                          ? widget.selectedIconColor ?? AppColors.primary500
                          : widget.unselectedIconColor ?? AppColors.neutralL900,
                      size: widget.iconSize ?? 25,
                    ),
                  ),
                ))
            .toList(),
        selectedIconColor: widget.selectedIconColor,
        unselectedIconColor: widget.unselectedIconColor,
        iconSize: widget.iconSize,
        hideCenterOutline: widget.hideCenterOutline,
      ),
      body: SafeArea(
        child: widget.screens[selectedTab],
      ),
    );
  }
}
