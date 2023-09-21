import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hex_ui_widgets/src/Utils/app_colors.dart';

class HexItemSelector extends StatelessWidget {
  const HexItemSelector({
    this.child,
    this.backgroundColor,
    this.outlineColor,
    this.outlineWidth,
    this.iconColor,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  /// The widget to be rendered inside the item.
  final Widget? child;

  /// The color of the background of the item.
  final Color? backgroundColor;

  /// The color of the outline of the item.
  final Color? outlineColor;

  /// The width of the outline.
  final double? outlineWidth;

  /// If null, the icon will not be rendered.
  final Color? iconColor;

  /// If true, the item will be rendered with a border.
  final bool isSelected;

  /// The callback to be called when the item is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SvgPicture.string(
            '''
            <svg
              width="97"
              height="107"
              viewBox="0 0 97 107"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                fill="${backgroundColor != null ? backgroundColor?.toHex() : AppColors.neutralD300.toHex()}"
                stroke="${outlineColor != null && isSelected ? outlineColor?.toHex() : 'none'}"
                stroke-width="${outlineWidth ?? '3'}"
                d="M62.9332 5.9927L82.1258 17.3947C90.4176 22.3207 95.5 31.2517 95.5 40.8964L95.5 65.4212C95.5 75.1455 90.334 84.1378 81.9334 89.0361L62.7419 100.226C54.2719 105.165 43.8055 105.189 35.3126 100.29L15.7601 89.0106C7.29759 84.1287 2.08371 75.1017 2.08371 65.332L2.08372 40.9859C2.08372 31.2955 7.21398 22.3294 15.5682 17.4191L35.1196 5.92753C43.7098 0.87853 54.3668 0.903503 62.9332 5.9927Z"/>
              <path
                fill-rule="evenodd"
                clip-rule="evenodd"
                fill="${iconColor != null && isSelected ? iconColor?.toHex() : 'none'}"
                d="M85 105C90.5228 105 95 100.523 95 95C95 89.4772 90.5228 85 85 85C79.4772 85 75 89.4772 75 95C75 100.523 79.4772 105 85 105ZM89.592 92.4605C89.8463 92.1335 89.7874 91.6623 89.4605 91.408C89.1335 91.1537 88.6623 91.2126 88.408 91.5396L84.401 96.6914C84.3119 96.806 84.1443 96.8209 84.0364 96.7238L81.5017 94.4426C81.1938 94.1655 80.7196 94.1904 80.4425 94.4983C80.1654 94.8062 80.1904 95.2804 80.4983 95.5575L83.033 97.8387C83.7881 98.5183 84.9613 98.4143 85.585 97.6123L89.592 92.4605Z"/>
            </svg>
            ''',
          ),
          Positioned(
            top: 5,
            left: 1,
            child: Container(
              height: 95,
              width: 95,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
