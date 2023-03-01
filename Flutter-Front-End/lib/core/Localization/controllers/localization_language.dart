import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationLanguageController extends GetxController {
  Locale initialLanguage =
      GetStorage().read('lang') == 'ar' ? const Locale('ar') : const Locale('en');

  void changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
    initialLanguage = Locale(codeLanguage);
    await GetStorage().write('lang', codeLanguage);
    Get.updateLocale(locale);
    update();
  }
}
