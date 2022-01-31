import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class JailBreakScreenController extends GetxController {
  final isCheck = false.obs;
  final message = ''.obs;
  double progress = 0;

  void onTap() async {
    bool jailBreak = await FlutterJailbreakDetection.jailbroken;
    isCheck.value = jailBreak;
    loadingDialog();
    await Future.delayed(const Duration(seconds: 4));
    if (jailBreak) {
      //true　脱獄されている。
      message.value = '脱獄の可能性があります';
    } else {
      //false　脱獄されていない。
      message.value = '問題なし';
    }
  }

  void loadingDialog() {
    progress = 0;
    var timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) {
        EasyLoading.showProgress(
          progress,
          status: '${(progress * 100).toStringAsFixed(0)}%',
        );
        progress += 0.03;
        if (progress >= 1) {
          timer.cancel();
          EasyLoading.dismiss();
        }
      },
    );
  }
}
