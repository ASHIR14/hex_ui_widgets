import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg
        width="47"
        height="47"
        viewBox="0 0 47 47" 
        fill="none"
        xmlns="http://www.w3.org/2000/svg">
        <g opacity="0.08">
          <circle cx="23.7207" cy="23.7787" r="22.9287" fill="#84D654"/>
        </g>
        <path
          fill-rule="evenodd"
          clip-rule="evenodd"
          fill="#84D654"
          d="M23.7124 33.5271C29.2352 33.5271 33.7124 29.0499 33.7124 23.5271C33.7124 18.0043 29.2352 13.5271 23.7124 13.5271C18.1896 13.5271 13.7124 18.0043 13.7124 23.5271C13.7124 29.0499 18.1896 33.5271 23.7124 33.5271ZM28.3044 20.9876C28.5587 20.6606 28.4998 20.1894 28.1729 19.9351C27.8459 19.6808 27.3747 19.7397 27.1204 20.0667L23.1134 25.2185C23.0243 25.3331 22.8567 25.348 22.7488 25.2509L20.2141 22.9697C19.9062 22.6926 19.432 22.7175 19.1549 23.0254C18.8778 23.3333 18.9028 23.8075 19.2107 24.0846L21.7454 26.3658C22.5005 27.0454 23.6737 26.9414 24.2974 26.1394L28.3044 20.9876Z"/>
      </svg>
      ''',
    );
  }
}
