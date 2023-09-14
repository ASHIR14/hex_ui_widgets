import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/app_colors.dart';

class BottomNavOutline extends StatelessWidget {
  const BottomNavOutline(
      {required this.selectedTab,
      this.height,
      this.primaryColor,
      this.secondaryColor,
      this.centerIconColor,
      this.hideCenterOutline = false,
      super.key});

  final int selectedTab;
  final double? height;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? centerIconColor;
  final bool hideCenterOutline;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="100%"
        height="100%"
        viewBox="0 0 377 82">
        <path
          stroke-width="2"
          stroke="url(#tab$selectedTab)"
          fill="none"
          d="M.746 45.052l22.076-22.076a16 16 0 0111.314-4.686h105.726a16 16 0 0011.314-4.687l7.878-7.878c3-3 7.07-4.686 11.313-4.686h31.404c4.243 0 8.313 1.686 11.314 4.686l7.878 7.878c3 3 7.07 4.687 11.313 4.687h110.079a16 16 0 0111.314 4.686l22.077 22.076"></path>
        <path
          stroke-width="${hideCenterOutline ? 0 : 2}"
          stroke="${selectedTab == 2 ? primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex() : centerIconColor != null ? centerIconColor!.toHex() : AppColors.neutralL900.toHex()}"
          fill="none"
          d="M161.963 46.383l6.628-11.415a15 15 0 0112.972-7.468h13.573a15 15 0 0113.032 7.573l6.506 11.415a15.002 15.002 0 01.034 14.794l-6.555 11.625a15 15 0 01-13.066 7.633h-13.475a15 15 0 01-13.006-7.528l-6.678-11.625a15 15 0 01.035-15.004z"></path>
        <defs>
          <linearGradient id="tab0" x1="196.875" y1="1.0389" x2="86.3894" y2="1.03893" gradientUnits="userSpaceOnUse">
            <stop stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
            <stop offset="1" stop-color="${primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex()}" />
          </linearGradient>
          <linearGradient id="tab1" x1="240.088" y1="1.53963" x2="0.745605" y2="1.5395" gradientUnits="userSpaceOnUse">
            <stop stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
            <stop offset="0.531335" stop-color="${primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex()}" />
            <stop offset="1"  stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
          </linearGradient>
          <linearGradient id="tab2" x1="375.746" y1="1.04053" x2="0.745605" y2="1.04032" gradientUnits="userSpaceOnUse">
            <stop stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
            <stop offset="0.501039" stop-color="${primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex()}" />
            <stop offset="1"  stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
          </linearGradient>
          <linearGradient id="tab3" x1="137.201" y1="1.12813" x2="376.543" y2="1.128" gradientUnits="userSpaceOnUse">
            <stop stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
            <stop offset="0.531335" stop-color="${primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex()}" />
            <stop offset="1"  stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
          </linearGradient>
          <linearGradient id="tab4" x1="180.414" y1="1.62886" x2="290.9" y2="1.62889" gradientUnits="userSpaceOnUse">
            <stop stop-color="${secondaryColor != null ? secondaryColor!.toHex() : AppColors.neutralD100.toHex()}" />
            <stop offset="1" stop-color="${primaryColor != null ? primaryColor!.toHex() : AppColors.primary500.toHex()}" />
          </linearGradient>
        </defs>
      </svg>
      ''',
      width: 377,
      height: height ?? 82,
    );
  }
}
