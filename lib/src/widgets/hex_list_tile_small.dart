import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hex_ui_widgets/src/Utils/app_colors.dart';

class HexListTileSmall extends StatelessWidget {
  const HexListTileSmall({
    this.leading,
    this.trailing,
    this.title,
    this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.backgroundColor,
    this.backgroundColorOpacity,
    this.outlineWidth,
    this.outlineColor,
    this.outlineGradientPrimaryColor,
    this.outlineGradientSecondaryColor,
    this.leadingBackgroundColor,
    this.leadingBackgroundColorOpacity,
    this.trailingBackgroundColor,
    this.trailingBackgroundColorOpacity,
    super.key,
  });

  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Color? backgroundColor;
  final double? backgroundColorOpacity;
  final double? outlineWidth;
  final Color? outlineColor;
  final Color? outlineGradientPrimaryColor;
  final Color? outlineGradientSecondaryColor;
  final Color? leadingBackgroundColor;
  final double? leadingBackgroundColorOpacity;
  final Color? trailingBackgroundColor;
  final double? trailingBackgroundColorOpacity;

  double getContainerWidth() {
    if (leading == null && trailing == null) {
      return 290;
    } else if (leading != null || trailing != null) {
      return 240;
    } else {
      return 185;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          SvgPicture.string(
            '''
            <svg
              width="337" 
              height="70"
              viewBox="0 0 337 70"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                stroke="${outlineColor != null ? outlineColor!.toHex() : (outlineGradientPrimaryColor != null || outlineGradientSecondaryColor != null) ? 'url(#paint0_linear_2210_9061)' : 'none'}"
                stroke-width="${outlineWidth ?? '1.5'}"
                fill="${backgroundColor != null ? backgroundColor!.toHex() : 'none'}"
                fill-opacity="${backgroundColorOpacity ?? '1'}"
                d="M16.1952 6.93134L3.23045 28.587C0.931827 32.4265 0.920563 37.2165 3.2011 41.0668L16.2038 63.0194C18.3995 66.7266 22.3884 69 26.6971 69L310.612 69C314.956 69 318.972 66.6892 321.155 62.9336L333.918 40.9805C336.131 37.1735 336.12 32.4691 333.889 28.6725L321.164 7.01731C318.974 3.2894 314.973 1 310.649 1L26.6592 1.00001C22.371 1.00001 18.3979 3.2521 16.1952 6.93134Z"/>
              <path
                fill="${leadingBackgroundColor != null ? leadingBackgroundColor!.toHex() : 'none'}"
                fill-opacity="${leadingBackgroundColorOpacity ?? '1'}"
                d="M58.1636 55.0637L66.3384 41.3033C68.5973 37.5009 68.6084 32.7707 66.3674 28.9578L58.1549 14.9853C55.9754 11.2771 51.9956 9 47.6944 9L30.6333 9C26.2969 9 22.2901 11.3143 20.1232 15.0705L12.0624 29.0434C9.88775 32.8131 9.89854 37.4588 12.0907 41.2183L20.1139 54.9783C22.2881 58.707 26.2795 61 30.5958 61L47.732 61C52.013 61 55.9771 58.7441 58.1636 55.0637Z"/>
              <path
                fill="${trailingBackgroundColor != null ? trailingBackgroundColor!.toHex() : 'none'}"
                fill-opacity="${trailingBackgroundColorOpacity ?? '1'}"
                d="M316.8364 55.0637L324.0112 41.3033C326.2701 37.5009 326.2812 32.7707 324.0402 28.9578L315.8277 14.9853C313.6482 11.2771 309.6684 9 305.3672 9L288.3061 9C283.9697 9 279.9629 11.3143 277.796 15.0705L269.7352 29.0434C267.5606 32.8131 267.5714 37.4588 269.7635 41.2183L277.7867 54.9783C279.9609 58.707 283.9523 61 288.2686 61L305.4048 61C309.6858 61 313.6499 58.7441 316.8364 55.0637Z"/>
              <defs>
                <linearGradient
                  id="paint0_linear_2210_9061"
                  x1="-2.25522"
                  y1="35.2602"
                  x2="324.49"
                  y2="35.2602"
                  gradientUnits="userSpaceOnUse">
                  <stop offset="0" stop-color="${outlineGradientPrimaryColor != null ? outlineGradientPrimaryColor!.toHex() : AppColors.primary500.toHex()}"/>
                  <stop offset="1" stop-color="${outlineGradientSecondaryColor != null ? outlineGradientSecondaryColor!.toHex() : AppColors.neutralD100.toHex()}"/>
                </linearGradient>
              </defs>
            </svg>
            ''',
          ),
          Positioned(
            top: 10,
            left: leading != null ? 75 : 25,
            child: SizedBox(
              height: 50,
              width: getContainerWidth(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: title != null,
                    child: Text(
                      title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle ??
                          TextStyle(
                            fontSize: 14,
                            color: AppColors.neutralL500,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: const SizedBox(height: 3),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: Text(
                      subTitle ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subTitleStyle ??
                          TextStyle(
                            fontSize: 12,
                            color: AppColors.neutralL800,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Visibility(
                    visible: subTitle != null,
                    child: const SizedBox(height: 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 11,
            left: 15.5,
            child: SizedBox(
              height: 48,
              width: 48,
              child: leading,
            ),
          ),
          Positioned(
            top: 11,
            right: 15.5,
            child: SizedBox(
              height: 48,
              width: 48,
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }
}
