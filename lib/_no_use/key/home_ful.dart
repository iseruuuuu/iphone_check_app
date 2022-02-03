// import 'package:apple_product_name/apple_product_name.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:network_info_plus/network_info_plus.dart';
// import 'package:flutter/cupertino.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final info = NetworkInfo();
//   String infoName = '';
//   String infoModel = '';
//   String infoSystemName = '';
//   String infoSystemVersion = '';
//   String infoMachine = '';
//
//   @override
//   void initState() {
//     super.initState();
//     checkAppProductName();
//   }
//
//   void checkAppProductName() async {
//     final info = await DeviceInfoPlugin().iosInfo;
//     var infoMachines = AppleProductName().lookup(info.utsname.machine!);
//     setState(() {
//       infoName = info.name!;
//       infoModel = info.model!;
//       infoSystemName = info.systemName!;
//       infoSystemVersion = info.systemVersion!;
//       infoMachine = infoMachines;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text(infoName),
//           Text(infoModel),
//           Text(infoSystemName),
//           Text(infoSystemVersion),
//           Text(infoMachine),
//         ],
//       ),
//     );
//   }
// }
