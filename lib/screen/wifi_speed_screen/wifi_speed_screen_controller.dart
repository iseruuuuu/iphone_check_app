import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WifiSpeedScreenController extends GetxController {
  WebViewController? _webViewController;

  void onTapReload() {
    _webViewController?.loadUrl('https://fast.com/ja/');
  }

  void onTapBack() {
   _webViewController?.goBack();
  }
}
