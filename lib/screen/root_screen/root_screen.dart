import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iphone_check_app/screen/home_screen/home_screen.dart';
import 'package:iphone_check_app/screen/jail_break_screen/jail_break_screen.dart';
import 'package:iphone_check_app/screen/root_screen/root_screen_controller.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen_ful.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen_ful2.dart';

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
                //const WifiSpeedScreenFul2(),
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
            title: Text('Home'),
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
            title: Text('Jail Break'),
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
            title: Text('Wifi Speed'),
          ),
        ],
      ),
    );
  }
}
