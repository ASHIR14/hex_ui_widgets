import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/app_colors.dart';

class HexSwipeButton extends StatefulWidget {
  /// The function that will be called when the button is swiped
  final Function onSwipeComplete;

  /// The minimum percentage of the button that needs to be swiped to trigger the onSwipeComplete function
  final double? minCompletionPercentage;

  /// If true, the button will return to the start position after swiping
  final bool returnToStart;

  /// The color of the outline of the button
  final Color? outlineColor;

  /// The width of the outline of the button
  final double? outlineWidth;

  /// The color of the background gradient
  final Color? gradientColor;

  /// The color of the thumb icon
  final Color? thumbColor;

  const HexSwipeButton({
    super.key,
    required this.onSwipeComplete,
    this.minCompletionPercentage,
    this.returnToStart = false,
    this.outlineColor,
    this.outlineWidth,
    this.gradientColor,
    this.thumbColor,
  });

  @override
  State<HexSwipeButton> createState() => _HexSwipeButtonState();
}

class _HexSwipeButtonState extends State<HexSwipeButton> {
  double _positionX =
      1.5; // The initial position is 1.5 instead of 0 for alignment purposes
  final double _maxPositionX =
      235; // The max position is 235 for alignment purposes

  // Function to handle updates during a drag gesture
  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      if (_positionX < _maxPositionX) {
        _positionX += details.delta.dx;
      }
    });
  }

  // Function to handle the end of a drag gesture
  void _onPanEnd(DragEndDetails details) {
    setState(() {
      // Check if the thumb has been swiped past the minimum completion percentage
      if (_positionX <
          _maxPositionX * (widget.minCompletionPercentage ?? 0.7)) {
        // If not, return the thumb to the start position
        _positionX = 1.5;
      } else {
        // If swiped sufficiently, move the thumb to the maximum position and trigger the onSwipeComplete function
        _positionX = _maxPositionX;
        widget.onSwipeComplete();
      }
      // Check if the returnToStart flag is true and the thumb is already at the maximum position
      if (widget.returnToStart == true && _positionX >= _maxPositionX) {
        _positionX = 1.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Stack(
        children: [
          // The background hexagonal shape
          SvgPicture.string(
            '''
            <svg
              width="305"
              height="64"
              viewBox="0 0 305 64"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                fill="url(#paint0_linear_174_2448)"
                fill-opacity="0.4"
                stroke="${widget.outlineColor != null ? widget.outlineColor?.toHex() : AppColors.primary500.toHex()}"
                stroke-width="${widget.outlineWidth ?? 2}"
                d="M13.6713 7.89386C16.4307 3.59755 21.1862 1.00003 26.2923 1.00003L278.129 1C283.147 1 287.834 3.51016 290.615 7.68811L301.266 23.6881C304.617 28.7226 304.617 35.2773 301.266 40.3119L290.615 56.3118C287.834 60.4898 283.147 62.9999 278.129 62.9999L26.2924 63C21.1862 63 16.4307 60.4025 13.6713 56.1062L3.3949 40.1062C0.222912 35.1675 0.222918 28.8325 3.39491 23.8938L13.6713 7.89386Z"/>
              <defs>
                <linearGradient
                  id="paint0_linear_174_2448"
                  x1="292.579"
                  y1="32"
                  x2="-3"
                  y2="32"
                  gradientUnits="userSpaceOnUse">
                  <stop  offset="0" stop-color="${widget.gradientColor != null ? widget.gradientColor?.toHex() : AppColors.primary500.toHex()}"/>
                  <stop offset="1" stop-opacity="0" stop-color="${widget.gradientColor != null ? widget.gradientColor?.toHex() : AppColors.primary500.toHex()}"/>
                </linearGradient>
              </defs>
            </svg>
          ''',
          ),
          AnimatedPositioned(
            left: _positionX,
            top: 1.5,
            duration: const Duration(milliseconds: 50),
            // The thumb icon
            child: SvgPicture.string(
              '''
              <svg
                width="79"
                height="73"
                viewBox="0 0 79 73"
                fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                  fill="${widget.thumbColor != null ? widget.thumbColor?.toHex() : AppColors.primary500.toHex()}"
                  d="M48.1584 49.5102L57.7258 34.6243C59.4121 32.0007 59.4199 28.6362 57.7459 26.0048L48.1542 10.9278C46.6859 8.61972 44.14 7.22193 41.4044 7.22193L24.6015 7.22193C21.8452 7.22193 19.2831 8.64079 17.8206 10.977L8.38217 26.0543C6.74967 28.6621 6.75731 31.975 8.40182 34.5753L17.8161 49.4609C19.2824 51.7793 21.8343 53.1848 24.5774 53.1848L41.4285 53.1848C44.1509 53.1848 46.6864 51.8004 48.1584 49.5102Z"/>
                <path
                   stroke="#F1F2F7"
                   stroke-width="1.5"
                   stroke-linecap="round"
                   stroke-linejoin="round"
                  d="M35.1016 34.2034L39.1016 30.2034M39.1016 30.2034L35.1016 26.2034M39.1016 30.2034L27.1016 30.2034"/>
              </svg>
            ''',
            ),
          ),
        ],
      ),
    );
  }
}
