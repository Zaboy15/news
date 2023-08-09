import 'package:get/get.dart';
import 'package:news/controllers/detail_controller.dart';
import 'package:news/controllers/home_controller.dart';

class TemplateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailController());
  }
}
