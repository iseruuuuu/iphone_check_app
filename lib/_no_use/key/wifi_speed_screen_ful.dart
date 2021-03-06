// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:internet_speed_test/callbacks_enum.dart';
// import 'package:internet_speed_test/internet_speed_test.dart';
// import 'package:iphone_check_app/component/wifi_speed/alert_style.dart';
// import 'package:iphone_check_app/component/wifi_speed/button_ink_item.dart';
// import 'package:iphone_check_app/component/wifi_speed/progress_bar.dart';
// import 'package:iphone_check_app/component/wifi_speed/show_error.dart';
// import 'package:iphone_check_app/component/wifi_speed/test_server.dart';
// import 'package:iphone_check_app/component/wifi_speed/show_label.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class WifiSpeedScreenFul extends StatefulWidget {
//   const WifiSpeedScreenFul({Key? key}) : super(key: key);
//
//   @override
//   _WifiSpeedScreenFulState createState() => _WifiSpeedScreenFulState();
// }
//
// class _WifiSpeedScreenFulState extends State<WifiSpeedScreenFul> {
//   final internetSpeedTest = InternetSpeedTest();
//   final ProgressBar progressBar = ProgressBar();
//   double downloadRate = 0;
//   double uploadRate = 0;
//   String downloadProgress = '0';
//   String uploadProgress = '0';
//   double displayRate = 0;
//   String displayRateTxt = '0.0';
//   double displayPer = 0;
//   String unitText = 'Mb/s';
//
//   // Using a flag to prevent the user from interrupting running tests
//   bool isTesting = false;
//
//   void protectGauge(double rate) {
//     // this function prevents the needle from exceeding the maximum limit of the gauge
//     if (rate > 150) {
//       displayRateTxt = rate.toStringAsFixed(2);
//     } else {
//       displayRate = rate;
//       displayRateTxt = displayRate.toStringAsFixed(2);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       backgroundColor: Colors.greenAccent,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: progressBar.showBar(displayPer),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 showLabel('Download', downloadRate, unitText),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 showLabel('Upload', uploadRate, unitText),
//               ],
//             ),
//             SfRadialGauge(
//                 title: const GaugeTitle(
//                     text: ' ',
//                     textStyle: TextStyle(
//                         fontSize: 20.0, fontWeight: FontWeight.bold)),
//                 axes: <RadialAxis>[
//                   RadialAxis(
//                       minimum: 0,
//                       maximum: 150,
//                       axisLabelStyle: const GaugeTextStyle(color: Colors.white),
//                       ranges: <GaugeRange>[
//                         GaugeRange(
//                             startValue: 0,
//                             endValue: 50,
//                             color: const Color.fromRGBO(153, 170, 181, 1),
//                             startWidth: 10,
//                             endWidth: 10),
//                         GaugeRange(
//                             startValue: 50,
//                             endValue: 100,
//                             color: const Color.fromRGBO(114, 137, 218, 1),
//                             startWidth: 10,
//                             endWidth: 10),
//                         GaugeRange(
//                             startValue: 100,
//                             endValue: 150,
//                             color: const Color.fromRGBO(153, 170, 181, 1),
//                             startWidth: 10,
//                             endWidth: 10)
//                       ],
//                       pointers: <GaugePointer>[
//                         NeedlePointer(
//                           value: displayRate,
//                           enableAnimation: true,
//                           needleColor: const Color.fromRGBO(114, 137, 218, 1),
//                         )
//                       ],
//                       annotations: <GaugeAnnotation>[
//                         GaugeAnnotation(
//                             widget: Text(
//                               displayRate.toStringAsFixed(2) + ' ' + unitText,
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             angle: 90,
//                             positionFactor: 0.5)
//                       ])
//                 ]),
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
//                   onPressed: () {
//                     if (!isTesting) {
//                       setState(() {
//                         isTesting = true;
//                       });
//                       internetSpeedTest.startDownloadTesting(
//                         onDone: (double transferRate, SpeedUnit unit) {
//                           setState(() {
//                             downloadRate = transferRate;
//                             protectGauge(downloadRate);
//                             unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
//                             downloadProgress = '100';
//                             displayPer = 100.0;
//                           });
//                           internetSpeedTest.startUploadTesting(
//                             onDone: (double transferRate, SpeedUnit unit) {
//                               setState(() {
//                                 uploadRate = transferRate;
//                                 uploadRate = uploadRate * 10;
//                                 protectGauge(uploadRate);
//                                 unitText =
//                                     unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
//                                 uploadProgress = '100';
//                                 displayPer = 100.0;
//                                 isTesting = false;
//                                 // Display speed test results
//                                 Alert(
//                                   context: context,
//                                   style: alertStyle,
//                                   type: AlertType.info,
//                                   title: "TEST RESULTS",
//                                   desc: 'Download Speed: ' +
//                                       downloadRate.toStringAsFixed(2) +
//                                       ' $unitText\nUpload Speed: ' +
//                                       uploadRate.toStringAsFixed(2) +
//                                       ' $unitText',
//                                   buttons: [
//                                     DialogButton(
//                                       child: Text(
//                                         "OK",
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 20),
//                                       ),
//                                       onPressed: () => Navigator.pop(context),
//                                       color: Color.fromRGBO(114, 137, 218, 1.0),
//                                       radius: BorderRadius.circular(0.0),
//                                     ),
//                                   ],
//                                 ).show();
//                               });
//                             },
//                             onProgress: (double percent, double transferRate,
//                                 SpeedUnit unit) {
//                               setState(() {
//                                 uploadRate = transferRate;
//                                 uploadRate = uploadRate * 10;
//                                 protectGauge(uploadRate);
//                                 unitText =
//                                     unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
//                                 uploadProgress = percent.toStringAsFixed(2);
//                                 displayPer = percent;
//                               });
//                             },
//                             onError:
//                                 (String errorMessage, String speedTestError) {
//                               showError(
//                                   'Upload test failed! Please check your internet connection.');
//                               setState(() {
//                                 isTesting = false;
//                               });
//                             },
//                             testServer: uploadServer,
//                             fileSize: 20000000,
//                           );
//                         },
//                         onProgress: (double percent, double transferRate,
//                             SpeedUnit unit) {
//                           setState(() {
//                             downloadRate = transferRate;
//                             protectGauge(downloadRate);
//                             unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
//                             downloadProgress = percent.toStringAsFixed(2);
//                             displayPer = percent;
//                           });
//                         },
//                         onError: (String errorMessage, String speedTestError) {
//                           showError(
//                               'Download test failed! Please check your internet connection.');
//                           setState(() {
//                             isTesting = false;
//                           });
//                         },
//                         testServer: downloadServer,
//                         fileSize: 20000000,
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
