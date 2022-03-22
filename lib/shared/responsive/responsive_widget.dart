import 'package:flutter/cupertino.dart';

import 'device_information.dart';
import 'get_device_type.dart';

class ResponsiveWidget extends StatelessWidget {

  final Function (DeviceInformation) responsiveWidget;

   const ResponsiveWidget({
    Key? key,
    required this.responsiveWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var mediaQueryData = MediaQuery.of(context);
      DeviceInformation deviceInformation = DeviceInformation(
          deviceType: getDeviceType(mediaQueryData),
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth,
          screenHeight: mediaQueryData.size.height,
          screenWidth: mediaQueryData.size.width,
          orientation: mediaQueryData.orientation,
      );
      return responsiveWidget(deviceInformation);
    });
  }
}

// Widget responsiveWidget({
//   required  Widget responsive(context, DeviceInformation deviceInformation),
// }) {
//   return LayoutBuilder(builder: (context, constraints) {
//     var mediaQueryData = MediaQuery.of(context);
//     DeviceInformation deviceInformation = DeviceInformation(
//         deviceType: getDeviceType(mediaQueryData),
//         localHeight: constraints.maxHeight,
//         localWidth: constraints.maxWidth,
//         screenHeight: mediaQueryData.size.height,
//         screenWidth: mediaQueryData.size.width,
//         orientation: mediaQueryData.orientation);
//     return responsive(context, deviceInformation);
//   });
// }
