import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iphone_check_app/screen/root_screen/root_screen.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'component/key/license_key.dart';

void main() async {
  //SyncfusionLicense.registerLicense(licenseKey);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootScreen(),
      builder: EasyLoading.init(),
    );
  }
}
