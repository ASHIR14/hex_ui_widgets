import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_colors.dart';

class LoaderIcon extends StatefulWidget {
  const LoaderIcon(
      {this.height,
      this.primaryColor,
      this.secondaryColor,
      this.radius = 3.22839,
      this.animationDuration = 150,
      super.key});

  /// Height of the icon, the width will automatically adjust
  final double? height;

  /// Color of the active cube
  final Color? primaryColor;

  /// Color of the inactive cubes
  final Color? secondaryColor;

  /// Radius of the rounded corners of cubes
  final double radius;

  /// Animation duration in milliseconds
  final int animationDuration;

  @override
  State<LoaderIcon> createState() => _LoaderIconState();
}

class _LoaderIconState extends State<LoaderIcon> {
  int activeIndex = 0;
  Color primaryColor = AppColors.neutralL900;
  Color secondaryColor = AppColors.neutralL800;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Set primaryColor and secondaryColor based on widget properties
    if (widget.primaryColor != null) {
      primaryColor = widget.primaryColor!;
    }
    if (widget.secondaryColor != null) {
      secondaryColor = widget.secondaryColor!;
    }
    // Create a periodic timer to update the active cube's index
    Duration interval = Duration(milliseconds: widget.animationDuration);
    timer = Timer.periodic(interval, (timer) {
      if (!mounted) return;
      setState(() {
        activeIndex = (activeIndex + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.string(
        '''
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="40"
          height="40"
          viewBox="0 0 40 40"
          fill="none">
          <rect
              x="19.9834"
              y="0"
              width="11.8688"
              height="11.8688"
              rx="${widget.radius}"
              transform="rotate(45 19.983 0)"
              fill="${0 == activeIndex ? primaryColor.toHex() : secondaryColor.toHex()}"
            />
          <rect
              x="31.271"
              y="11.9102"
              width="11.8688"
              height="11.8688"
              rx="${widget.radius}"
              transform="rotate(45 31.271 11.91)"
              fill="${1 == activeIndex ? primaryColor.toHex() : secondaryColor.toHex()}"
            />
          <rect
              x="19.9834"
              y="23.2148"
              width="11.8688"
              height="11.8688"
              rx="${widget.radius}"
              transform="rotate(45 19.983 23.215)"
              fill="${2 == activeIndex ? primaryColor.toHex() : secondaryColor.toHex()}"
            />
          <rect
              x="8.729"
              y="11.9102"
              width="11.8688"
              height="11.8688"
              rx="${widget.radius}"
              transform="rotate(45 8.729 11.91)"
              fill="${3 == activeIndex ? primaryColor.toHex() : secondaryColor.toHex()}"
            />
        </svg>
        ''',
        height: widget.height ?? 40,
      ),
    );
  }
}
