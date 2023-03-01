import 'package:cozy/core/Localization/controllers/localization_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LocalizationLanguageController>();
    String dropdownValue = controller.initialLanguage.toString();

    var items = [
      'en',
      'ar',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "settingLanguage".tr,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 50,
            ),
            DropdownButton(
              // Initial Value
              value: dropdownValue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                controller.changeLanguage(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
