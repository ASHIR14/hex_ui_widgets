import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarningIcon extends StatelessWidget {
  const WarningIcon({super.key});

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
          <circle cx="23.7207" cy="23.7787" r="22.9287" fill="#FEDF56"/>
        </g>
        <path
          fill-rule="evenodd"
          clip-rule="evenodd"
          fill="#FEDF56"
          d="M23.1772 13.4103C17.6544 13.4103 13.1772 17.8874 13.1772 23.4103C13.1772 28.9331 17.6544 33.4103 23.1772 33.4103C28.7001 33.4103 33.1772 28.9331 33.1772 23.4103C33.1772 17.8874 28.7001 13.4103 23.1772 13.4103ZM22.4272 27.4103C22.4272 27.8245 22.763 28.1603 23.1772 28.1603C23.5915 28.1603 23.9272 27.8245 23.9272 27.4103L23.9272 26.4103C23.9272 25.9961 23.5915 25.6603 23.1772 25.6603C22.763 25.6603 22.4272 25.9961 22.4272 26.4103L22.4272 27.4103ZM22.4272 23.9103C22.4272 24.3245 22.763 24.6603 23.1772 24.6603C23.5915 24.6603 23.9272 24.3245 23.9272 23.9103L23.9272 19.4103C23.9272 18.9961 23.5915 18.6603 23.1772 18.6603C22.763 18.6603 22.4272 18.9961 22.4272 19.4103L22.4272 23.9103Z"/>
      </svg>
      ''',
    );
  }
}
