import 'package:cozy/auth/controllers/auth_controller.dart';
import 'package:cozy/auth/view/widgets/settings/dark_mode_widget.dart';
import 'package:cozy/theme/utils/text_utils.dart';
import 'package:cozy/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/settings/change_password.dart';
import '../../widgets/settings/logout.dart';
import '../../widgets/settings/notification.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Settings',
            style: TextStyle(color: googleColor),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: googleColor,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 3.5.h,
            ),
            TextUtils(
              fontsize: 14.sp,
              fontWeight: FontWeight.bold,
              text: "Account",
              color:  googleColor,
            ),
            SizedBox(
              height: 3.5.h,
            ),
            ChangePassword(),
            Divider(
              color: Get.isDarkMode ? Colors.white: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            NotificationWidget(),
            Divider(
              color:   Get.isDarkMode ? Colors.white: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            DarkModeWidget(),
            Divider(
              color:   Get.isDarkMode ? Colors.white: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            LogOut(),
          ],
        ),
      ),
    );
  }
}
