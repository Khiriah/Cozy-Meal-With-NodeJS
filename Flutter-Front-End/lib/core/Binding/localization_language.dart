import 'package:cozy/core/Localization/controllers/localization_language.dart';
import 'package:cozy/product/controllers/main_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalizationLanguageController>(LocalizationLanguageController());
    Get.put<MainController>(MainController());
  }
}
