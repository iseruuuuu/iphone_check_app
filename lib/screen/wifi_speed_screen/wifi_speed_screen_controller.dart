import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:iphone_check_app/component/wifi_speed/alert_style.dart';
import 'package:iphone_check_app/component/wifi_speed/progress_bar.dart';
import 'package:iphone_check_app/component/wifi_speed/show_error.dart';
import 'package:iphone_check_app/component/wifi_speed/test_server.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WifiSpeedScreenController extends GetxController {
  final internetSpeedTest = InternetSpeedTest();
  final ProgressBar progressBar = ProgressBar();
  final downloadRate = 0.0.obs;
  final uploadRate = 0.0.obs;
  final downloadProgress = '0'.obs;
  final uploadProgress = '0'.obs;

  //double
  final displayRate = 0.0.obs;
  final displayRateTxt = '0.0'.obs;
  final displayPer = 0.0.obs;
  final unitText = 'Mb/s'.obs;

  bool isTesting = false;

  //Gauge...軽量機
  void protectGauge(double rate) {
    if (rate > 150) {
      displayRateTxt.value = rate.toStringAsFixed(2);
    } else {
      displayRate.value = rate;
      displayRateTxt.value = displayRate.toStringAsFixed(2);
    }
  }

  void onTap() {
    if (!isTesting) {
      isTesting = true;
      internetSpeedTest.startDownloadTesting(
        onDone: (double transferRate, SpeedUnit unit) {
          downloadRate.value = transferRate;
          protectGauge(downloadRate.value);
          unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          downloadProgress.value = '100';
          displayPer.value = 100.0;

          internetSpeedTest.startUploadTesting(
            onDone: (double transferRate, SpeedUnit unit) {
              uploadRate.value = transferRate;
              uploadRate.value = uploadRate * 10;
              protectGauge(uploadRate.value);
              unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              uploadProgress.value = '100';
              displayPer.value = 100.0;
              isTesting = false;
              // Display speed test results
              Alert(
                context: Get.context!,
                style: alertStyle,
                type: AlertType.info,
                title: "TEST RESULTS",
                desc: 'Download Speed: ' +
                    downloadRate.toStringAsFixed(2) +
                    ' $unitText\nUpload Speed: ' +
                    uploadRate.toStringAsFixed(2) +
                    ' $unitText',
                buttons: [
                  DialogButton(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(Get.context!),
                    color: const Color.fromRGBO(114, 137, 218, 1.0),
                    radius: BorderRadius.circular(0.0),
                  ),
                ],
              ).show();
            },
            onProgress: (double percent, double transferRate, SpeedUnit unit) {
              uploadRate.value = transferRate;
              uploadRate.value = uploadRate * 10;
              protectGauge(uploadRate.value);
              unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              uploadProgress.value = percent.toStringAsFixed(2);
              displayPer.value = percent;
            },
            onError: (String errorMessage, String speedTestError) {
              showError(
                  'Upload test failed! Please check your internet connection.');

              isTesting = false;
            },
            //TODO 自分で作る必要あり？？
            testServer: uploadServer,
            fileSize: 20000000,
          );
        },
        onProgress: (double percent, double transferRate, SpeedUnit unit) {
          downloadRate.value = transferRate;
          protectGauge(downloadRate.value);
          unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          downloadProgress.value = percent.toStringAsFixed(2);
          displayPer.value = percent;
        },
        onError: (String errorMessage, String speedTestError) {
          showError(
              'Download test failed! Please check your internet connection.');
          isTesting = false;
        },
        testServer: downloadServer,
        fileSize: 20000000,
      );
    }
  }
}
