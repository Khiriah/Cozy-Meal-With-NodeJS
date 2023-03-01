import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cozy/auth/view/widgets/auth_button.dart';
import 'package:cozy/core/Routes/routes.dart';
import 'package:cozy/theme/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: [
              googleColor,
              mainColor,
              mainColor,
              mainColor,
              mainColor,
              mainColor,
              mainColor,
              mainColor
            ])),
        child: Stack(
          children: [
            Positioned(
              child: Transform.translate(
                offset: Offset(
                  animation.value,
                  animation.value,
                ),
                child: BlurryContainer(
                  height: 150,
                  width: 150,
                  borderRadius: BorderRadius.circular(100),
                  color: googleColor,
                  blur: 2,
                  child: Container(),
                ),
              ),
            ),
            Bounce(
              child: Positioned(
                bottom: 60,
                left: 150,
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 150,
                    width: 150,
                    borderRadius: BorderRadius.circular(100),
                    color: googleColor.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        color: googleColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cozy   Meal",
                  style: TextStyle(
                      color: googleColor.withOpacity(.9),
                      fontSize: 25,
                      fontFamily: "Electrolyze",
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // * side bar and shakes items
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // * side navBar
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          AuthButton(
                            onPressed: () {
                              Get.toNamed(Routes.stockScreen);
                            },
                            text: 'Admin',
                          ),
                          AuthButton(
                            onPressed: () {
                              Get.offNamed(Routes.mainScreen);
                            },
                            text: 'User',
                          ),
                          // AuthButton(onPressed: () {    throw Exception(); }, text: 'User',),
                          //
                        ],
                      ),
                    ),

                    // * items list
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
