// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iphone_check_app/component/wifi_speed/button_ink_item.dart';
// import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen_controller.dart';
// import 'package:iphone_check_app/component/wifi_speed/show_label.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class WifiSpeedScreen extends StatelessWidget {
//   const WifiSpeedScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(WifiSpeedScreenController());
//     return Scaffold(
//       backgroundColor: Colors.greenAccent,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Obx(
//                   () => Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: controller.progressBar
//                         .showBar(controller.displayPer.value),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 showLabel(
//                   'Download',
//                   controller.downloadRate.value,
//                   controller.unitText.value,
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 showLabel(
//                   'Upload',
//                   controller.uploadRate.value,
//                   controller.unitText.value,
//                 ),
//               ],
//             ),
//             SfRadialGauge(
//               title: const GaugeTitle(
//                 text: ' ',
//                 textStyle: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               axes: <RadialAxis>[
//                 RadialAxis(
//                   minimum: 0,
//                   maximum: 150,
//                   axisLabelStyle: const GaugeTextStyle(color: Colors.white),
//                   ranges: <GaugeRange>[
//                     GaugeRange(
//                       startValue: 0,
//                       endValue: 50,
//                       color: const Color.fromRGBO(153, 170, 181, 1),
//                       startWidth: 10,
//                       endWidth: 10,
//                     ),
//                     GaugeRange(
//                       startValue: 50,
//                       endValue: 100,
//                       color: const Color.fromRGBO(114, 137, 218, 1),
//                       startWidth: 10,
//                       endWidth: 10,
//                     ),
//                     GaugeRange(
//                       startValue: 100,
//                       endValue: 150,
//                       color: const Color.fromRGBO(153, 170, 181, 1),
//                       startWidth: 10,
//                       endWidth: 10,
//                     ),
//                   ],
//                   pointers: <GaugePointer>[
//                     NeedlePointer(
//                       value: controller.displayRate.value,
//                       enableAnimation: true,
//                       needleColor: const Color.fromRGBO(114, 137, 218, 1),
//                     ),
//                   ],
//                   annotations: <GaugeAnnotation>[
//                     GaugeAnnotation(
//                       widget: Text(
//                         controller.displayRate.value.toStringAsFixed(2) +
//                             '' +
//                             controller.unitText.value,
//                         style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       angle: 90,
//                       positionFactor: 0.5,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RaisedButton(
//                   child: buttonInkItem,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(80.0)),
//                   padding: const EdgeInsets.all(0.0),
//                   color: Colors.red,
//                   textColor: Colors.white,
//                   onPressed: controller.onTap,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
