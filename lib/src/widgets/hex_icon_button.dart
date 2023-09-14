import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_colors.dart';
import 'loader_icon.dart';

class HexIconButton extends StatelessWidget {
  /// The icon to be shown on the button.
  final Widget icon;

  /// The height of the button, width will automatically adjust.
  final double? height;

  /// The function to be called when the button is pressed.
  final Function()? onPress;

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

  const HexIconButton({
    super.key,
    required this.icon,
    this.height,
    this.onPress,
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
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (shadowColor ?? AppColors.primary500)
                            .withOpacity(shadowOpacity ?? 0.2),
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
                viewBox="0 0 64 71">
                <path
                  stroke-width="${outlineWidth ?? 2}"
                  stroke="${getOutline().toHex()}"
                  fill="${getColor().toHex()}"
                   d="M9.839 56.884a16 16 0 01-7.086-13.286V28.822a16 16 0 016.866-13.136L22.75 6.554a16 16 0 0118.199-.048L54.31 15.69a16 16 0 016.936 13.185v14.667a16 16 0 01-7.156 13.334L40.727 65.74a16 16 0 01-17.758-.047l-13.13-8.81z"></path>
               </svg>
              ''',
              width: 64, // Set the default width here
              height: height ?? 71,
            ),
          ),
          Positioned(
            top: 3,
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
                  : icon,
            ),
          ),
        ],
      ),
    );
  }
}
