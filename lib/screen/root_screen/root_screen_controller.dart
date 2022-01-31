import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:iphone_check_app/screen/jail_break_screen/jail_break_screen.dart';
import 'package:iphone_check_app/screen/wifi_speed_screen/wifi_speed_screen.dart';

import 'package:rxdart/rxdart.dart';

class RootScreenController extends GetxController {

  final pageCount = 0.obs;
  final tabController = CupertinoTabController(initialIndex: 0);
  final subscription = CompositeSubscription();
}
