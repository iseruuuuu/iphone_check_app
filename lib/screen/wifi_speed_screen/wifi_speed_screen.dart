import 'package:flutter/cupertino.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiSpeedScreen extends StatelessWidget {
  const WifiSpeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WifiSpeedScreenController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: CupertinoColors.activeBlue,
        ),
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     padding: const EdgeInsets.only(left: 20),
      //     onPressed: () => controller.onTapBack(),
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       size: 40,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       padding: const EdgeInsets.only(right: 30),
      //       onPressed: () => controller.onTapReload(),
      //       icon: const Icon(
      //         Icons.refresh,
      //         size: 40,
      //       ),
      //     ),
      //   ],
      // ),

      body: const WebView(
        initialUrl: 'https://fast.com/ja/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
