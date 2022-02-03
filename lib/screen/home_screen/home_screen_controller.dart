import 'package:apple_product_name/apple_product_name.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final infoName = ''.obs;
  final infoModel = ''.obs;
  final infoSystemName = ''.obs;
  final infoSystemVersion = ''.obs;
  final infoMachine = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkAppProductName();
  }

  void onTap() {
    checkAppProductName();
  }

  void checkAppProductName() async {
    final info = await DeviceInfoPlugin().iosInfo;
    var infoMachines = AppleProductName().lookup(info.utsname.machine!);
    infoName.value = info.name!; //iPhone 8 Plus -> 携帯名　→いせきいいいい//iPhone
    infoModel.value = info.model!; //iOS
    infoSystemName.value = info.systemName!;
    infoSystemVersion.value = info.systemVersion!; //15.2
    infoMachine.value = infoMachines; //iPhone 8
  }
}
