import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iphone_check_app/screen/home_screen/home_screen.dart';
import 'package:iphone_check_app/screen/jail_break_screen/jail_break_screen.dart';
import 'package:iphone_check_app/screen/root_screen/root_screen_controller.dart';
import 'package:iphone_check_app/_no_use/key/wifi_speed_screensasa.dart';
import 'package:iphone_check_app/_no_use/key/wifi_speed_screen_ful.dart';
import 'package:iphone_check_app/_no_use/key/wifi_speed_screen_ful2.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootScreenController());
    return CupertinoTabScaffold(
      controller: controller.tabController,
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              child: [
                const HomeScreen(),
                const JailBreakScreen(),
                const WifiSpeedScreen(),
              ][index],
            );
          },
        );
      },
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35.0,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              size: 35.0,
              color: Colors.black,
            ),
            title: Text(
              '端末情報',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 35.0,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 35.0,
              color: Colors.black,
            ),
            title: Text(
              '脱獄チェッカー',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wifi_outlined,
              size: 35.0,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.wifi,
              size: 35.0,
              color: Colors.black,
            ),
            title: Text(
              'Wifi Speed',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
