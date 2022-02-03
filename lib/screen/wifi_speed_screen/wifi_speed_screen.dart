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
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.onTapBack,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: controller.onTapReload,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: const WebView(
        initialUrl: 'https://fast.com/ja/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
