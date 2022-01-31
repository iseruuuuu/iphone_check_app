import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iphone_check_app/component/home/row_text.dart';

import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('端末情報'),
        actions: [
          GestureDetector(
            onTap: controller.onTap,
            child: const Icon(
              Icons.refresh,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => RowText(
              rightText: 'インターネット情報',
              leftText: controller.connectivityResults.value,
            ),
          ),
          Obx(
            () => RowText(
              rightText: 'iOSバージョン',
              leftText: controller.infoSystemName.value,
            ),
          ),
          Obx(
            () => RowText(
              rightText: 'システムバージョン',
              leftText: controller.infoSystemVersion.value,
            ),
          ),
          Obx(
            () => RowText(
              rightText: '端末',
              leftText: controller.infoModel.value,
            ),
          ),
          Obx(
            () => RowText(
              rightText: '名前',
              leftText: controller.infoName.value,
            ),
          ),
          Obx(
            () => RowText(
              rightText: '機種名',
              leftText: controller.infoMachine.value,
            ),
          ),
        ],
      ),
    );
  }
}
