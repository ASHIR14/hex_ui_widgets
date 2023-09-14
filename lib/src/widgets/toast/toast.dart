import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../utils/enums.dart';
import 'error_icon.dart';
import 'info_icon.dart';
import 'success_icon.dart';
import 'toast_background.dart';
import 'warning_icon.dart';

class Toast extends StatelessWidget {
  const Toast(
      {required this.toastType,
      required this.message,
      this.backgroundColor,
      this.backgroundOpacity,
      this.title,
      this.messageStyle,
      this.titleStyle,
      this.onActionIconPressed,
      this.actionIcon,
      this.actionIconColor,
      this.actionIconSize,
      super.key});

  /// The type of toast to display [success, error, warning, info].
  final ToastType toastType;

  /// The background color of the toast.
  final Color? backgroundColor;

  /// The opacity of the background color of the toast.
  final double? backgroundOpacity;

  /// The title of the toast.
  final String? title;

  /// The message of the toast.
  final String message;

  /// The style of the title of the toast.
  final TextStyle? titleStyle;

  /// The style of the message of the toast.
  final TextStyle? messageStyle;

  /// The callback function when the action icon is pressed.
  final VoidCallback? onActionIconPressed;

  /// The icon of the action button.
  final IconData? actionIcon;

  /// The color of the action button.
  final Color? actionIconColor;

  /// The size of the action button.
  final double? actionIconSize;

  Widget getLeadingIcon() {
    switch (toastType) {
      case ToastType.error:
        return const ErrorIcon();
      case ToastType.warning:
        return const WarningIcon();
      case ToastType.success:
        return const SuccessIcon();
      default:
        return const InfoIcon();
    }
  }

  String getTitle() {
    if (title != null) {
      return title ?? '';
    } else {
      switch (toastType) {
        case ToastType.error:
          return 'Oh snap!';
        case ToastType.warning:
          return 'Warning!';
        case ToastType.success:
          return 'Success!';
        default:
          return 'Notice!';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ToastBackground(backgroundColor: backgroundColor),
        Positioned(
          left: 20,
          top: 12,
          child: SizedBox(
            width: 275,
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getLeadingIcon(),
                SizedBox(
                  width: 190,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTitle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle ??
                            TextStyle(
                              fontSize: 14,
                              color: AppColors.neutralL500,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: messageStyle ??
                            TextStyle(
                              fontSize: 12,
                              color: AppColors.neutralL800,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: onActionIconPressed,
                    child: Icon(
                      actionIcon ?? Icons.close,
                      size: actionIconSize ?? 18,
                      color: actionIconColor ?? AppColors.neutralL900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
