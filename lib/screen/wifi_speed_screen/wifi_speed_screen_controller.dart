import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WifiSpeedScreenController extends GetxController {
  WebViewController? _webViewController;

  void onTapReload() {
   // _webViewController?.loadUrl('https://fast.com/ja/');
    _webViewController?.loadUrl('https://www.youtube.com/watch?v=0fXR-Ksuqo4');
  }

  void onTapBack() {
    _webViewController?.goBack();
  }
}
