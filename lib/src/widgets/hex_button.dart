import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_colors.dart';
import 'loader_icon.dart';

class HexButton extends StatelessWidget {
  /// The text style of the title of the button.
  final TextStyle? textStyle;

  /// The height of the button.
  final double? height;

  /// The function that will be called when the button is pressed.
  final Function()? onPress;

  /// The text of the button.
  final String text;

  /// The outline color of the button.
  final Color? outline;

  /// The width of the outline of the button.
  final double? outlineWidth;

  /// The color of the button.
  final Color? color;

  /// Whether the button is disabled or not.
  final bool disabled;

  /// The outline color of the button when it is disabled.
  final Color? disabledOutline;

  /// The color of the button when it is disabled.
  final Color? disabledColor;

  /// Whether the button is loading or not.
  final bool isLoading;

  /// The height of the loader.
  final double? loaderHeight;

  /// The primary color of the loader.
  final Color? loaderPrimaryColor;

  /// The secondary color of the loader.
  final Color? loaderSecondaryColor;

  /// Whether the button has shadow or not.
  final bool disableShadow;

  /// The color of the shadow.
  final Color? shadowColor;

  /// The opacity of the shadow.
  final double? shadowOpacity;

  /// The blur radius of the shadow.
  final double? shadowBlurRadius;

  /// The spread radius of the shadow.
  final double? shadowSpreadRadius;

  const HexButton({
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
                    borderRadius: BorderRadius.circular(height ?? 64),
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
                viewBox="0 0 309 64">
                <path
                  stroke-width="${outlineWidth ?? 2}"
                  stroke="${getOutline().toHex()}"
                  fill="${getColor().toHex()}"
                   d="M12.983 8.192A15 15 0 0125.79 1H282.29a15 15 0 0112.68 6.987l10.11 16a14.998 14.998 0 010 16.026l-10.11 16A15 15 0 01282.289 63H25.79a15 15 0 01-12.807-7.192l-9.755-16a15 15 0 010-15.616l9.755-16z"></path>
               </svg>
              ''',
              width: 309, // Set the default width here
              height: height ?? 64,
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
                      height: loaderHeight ?? 30,
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
