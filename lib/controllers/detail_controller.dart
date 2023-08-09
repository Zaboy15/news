import 'package:get/get.dart';

class DetailController extends GetxController {
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    print(argumentData);
    super.onInit();
  }
}
