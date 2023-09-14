import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_colors.dart';
import 'loader_icon.dart';

class HexButtonSmall extends StatelessWidget {
  /// The text style of the title of the button.
  final TextStyle? textStyle;

  /// The height of the button, width will automatically adjust.
  final double? height;

  /// The function to be called when the button is pressed.
  final Function()? onPress;

  /// The text to be shown on the button.
  final String text;

  /// The color of the outline of the button.
  final Color? outline;

  /// The width of the outline of the button.
  final double? outlineWidth;

  /// The color of the button.
  final Color? color;

  /// Whether to disable the button.
  final bool disabled;

  /// The color of the outline when disabled.
  final Color? disabledOutline;

  /// The color of the button when disabled.
  final Color? disabledColor;

  /// Whether to show the loader.
  final bool isLoading;

  /// The height of the loader.
  final double? loaderHeight;

  /// The primary color of the loader to be shown on the highlighted cube.
  final Color? loaderPrimaryColor;

  /// The secondary color of the loader to be shown on the un-highlighted cubes.
  final Color? loaderSecondaryColor;

  /// Whether to disable the shadow.
  final bool disableShadow;

  /// The color of the shadow.
  final Color? shadowColor;

  /// The opacity of the shadow.
  final double? shadowOpacity;

  /// The blur radius for the shadow.
  final double? shadowBlurRadius;

  /// The spread radius for the shadow.
  final double? shadowSpreadRadius;

  const HexButtonSmall({
    super.key,
    required this.text,
    this.height,
    this.onPress,
    this.textStyle,
    this.outline,
    this.outlineWidth,
    this.color,
    this.disabled = false,
    this.disabledOutline,
    this.disabledColor,
    this.isLoading = false,
    this.loaderHeight,
    this.loaderPrimaryColor,
    this.loaderSecondaryColor,
    this.disableShadow = false,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowBlurRadius,
    this.shadowSpreadRadius,
  });

  Color getOutline() {
    if (disabled) {
      return disabledOutline ?? AppColors.neutralL900;
    }
    return outline ?? AppColors.primary500;
  }

  Color getColor() {
    if (disabled) {
      return disabledColor ?? AppColors.neutralL900;
    }
    return color ?? AppColors.primary500;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPress,
      child: Stack(
        children: [
          Container(
            decoration: disableShadow
                ? null
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(height ?? 65),
                    boxShadow: [
                      BoxShadow(
                        color: (shadowColor ?? AppColors.primary500)
                            .withOpacity(shadowOpacity ?? 0.15),
                        spreadRadius: shadowSpreadRadius ?? 7,
                        blurRadius: shadowBlurRadius ?? 7,
                      ),
                    ],
                  ),
            child: SvgPicture.string(
              '''
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="100%"
                height="100%"
                viewBox="0 0 160 65">
                <path
                  stroke-width="${outlineWidth ?? 2}"
                  stroke="${getOutline().toHex()}"
                  fill="${getColor().toHex()}"
                   d="M14.044 8.27a15 15 0 0112.808-7.19h105.753a15 15 0 0112.681 6.987l10.11 16a14.998 14.998 0 010 16.025l-10.11 16a15 15 0 01-12.681 6.987H26.852a15 15 0 01-12.808-7.191l-9.754-16a15 15 0 010-15.617l9.755-16z"></path>
               </svg>
              ''',
              width: 160, // Set the default width here
              height: height ?? 65,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: isLoading
                  ? LoaderIcon(
                      height: loaderHeight ?? 25,
                      primaryColor: loaderPrimaryColor ?? AppColors.neutralL500,
                      secondaryColor:
                          loaderSecondaryColor ?? AppColors.primary300,
                    )
                  : Text(
                      text,
                      style: textStyle ??
                          TextStyle(
                            fontSize: 14,
                            color: AppColors.neutralL500,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
