import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/app_colors.dart';

class ToastBackground extends StatelessWidget {
  const ToastBackground(
      {this.backgroundColor, this.backgroundOpacity, super.key});

  final Color? backgroundColor;
  final double? backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg
        width="319"
        height="86"
        viewBox="0 0 319 86"
        fill="none"
        xmlns="http://www.w3.org/2000/svg">
        <path
          fill="${backgroundColor != null ? backgroundColor?.toHex() : '#222d45'}"
          fill-opacity="${backgroundOpacity ?? 0.56}"
          d="M1.87796e-05 52.718L7.12833e-05 25.7463C8.87266e-05 16.7855 9.74482e-05 12.3051 1.744 8.88249C3.27797 5.87191 5.72566 3.42422 8.73625 1.89025C12.1588 0.146362 16.6393 0.146362 25.6001 0.146362H288.882C293.146 0.146362 295.278 0.146362 297.263 0.663773C299.022 1.1223 300.69 1.87722 302.195 2.89611C303.894 4.04583 305.301 5.64761 308.115 8.85117L312.121 13.4119L312.122 13.4121C314.477 16.0938 315.655 17.4346 316.495 18.9548C317.239 20.3032 317.785 21.7521 318.116 23.2566C318.488 24.9528 318.488 26.7375 318.488 30.3071L318.488 60.1037V60.104C318.488 69.0646 318.488 73.545 316.744 76.9676C315.21 79.9781 312.763 82.4258 309.752 83.9598C306.329 85.7037 301.849 85.7037 292.888 85.7037H32.0879C27.8238 85.7037 25.6918 85.7037 23.707 85.1863C21.948 84.7278 20.28 83.9728 18.7747 82.9539C17.076 81.8042 15.6689 80.2025 12.8548 76.9989L12.8548 76.9989L6.36691 69.6133C4.0111 66.9314 2.83319 65.5905 1.99369 64.0703C1.24908 62.7219 0.703084 61.273 0.372606 59.7686C8.35668e-06 58.0724 1.1831e-05 56.2876 1.87796e-05 52.718Z"/>
      </svg>

      ''',
    );
  }
}
