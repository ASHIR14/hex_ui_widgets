import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/app_colors.dart';

class HexListTileLarge extends StatelessWidget {
  const HexListTileLarge({
    this.child,
    this.backgroundColor,
    this.backgroundColorOpacity,
    this.outlineWidth,
    this.outlineColor,
    this.outlineGradientPrimaryColor,
    this.outlineGradientSecondaryColor,
    this.onTap,
    this.disableShadow = true,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowBlurRadius,
    this.shadowSpreadRadius,
    super.key,
  });

  /// The child widget of the List Tile.
  final Widget? child;

  /// The background color of the List Tile.
  final Color? backgroundColor;

  /// The opacity of the background color.
  final double? backgroundColorOpacity;

  /// The width of the outline.
  final double? outlineWidth;

  /// The color of the outline.
  final Color? outlineColor;

  /// The primary color of the outline gradient.
  /// If [outlineColor] is not null, this will be ignored.
  final Color? outlineGradientPrimaryColor;

  /// The secondary color of the outline gradient.
  /// If [outlineColor] is not null, this will be ignored.
  final Color? outlineGradientSecondaryColor;

  /// The function to be called when the button is pressed.
  final VoidCallback? onTap;

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: disableShadow
                ? null
                : BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (shadowColor ?? AppColors.primary500)
                            .withOpacity(shadowOpacity ?? 0.15),
                        spreadRadius: shadowSpreadRadius ?? 3,
                        blurRadius: shadowBlurRadius ?? 3,
                      ),
                    ],
                  ),
            child: SvgPicture.string(
              '''
              <svg
                width="336"
                height="115"
                viewBox="0 0 336 115"
                fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                  stroke="${outlineColor != null ? outlineColor!.toHex() : (outlineGradientPrimaryColor != null || outlineGradientSecondaryColor != null) ? 'url(#paint0_linear_2210_9061)' : 'none'}"
                  stroke-width="${outlineWidth ?? '1.5'}"
                  fill="${backgroundColor != null ? backgroundColor!.toHex() : 'none'}"
                  fill-opacity="${backgroundColorOpacity ?? '1'}"
                  d="M330.928 23.3329L312.167 4.57205C309.88 2.2849 306.778 1 303.543 1H13.1959C6.46028 1 1 6.46029 1 13.1959V83.9413C1 87.1759 2.28492 90.2779 4.57209 92.5651L22.323 110.316C24.6102 112.603 27.7122 113.888 30.9468 113.888H322.304C329.04 113.888 334.5 108.428 334.5 101.692V31.9568C334.5 28.7222 333.215 25.6201 330.928 23.3329Z"/>
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
          ),
          Positioned(
            top: 5,
            left: 5,
            child: SizedBox(
              height: 105,
              width: 325,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
