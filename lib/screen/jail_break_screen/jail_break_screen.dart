import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iphone_check_app/screen/jail_break_screen/jail_break_screen_controller.dart';

class JailBreakScreen extends StatelessWidget {
  const JailBreakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JailBreakScreenController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: CupertinoColors.activeBlue,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '脱獄チェッカー',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Text(
                controller.message.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: controller.isCheck.value ? Colors.red : Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: controller.onTap,
              child: const Text(
                'チェック',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
