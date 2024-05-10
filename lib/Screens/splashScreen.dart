import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/playScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // using getx
      // Get.to(() => const PlayScreen());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => PlayScreen()));
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red,
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  "assets/icons/icons8-tic-tac-toe-64.png",
                  scale: 0.75,
                ),
                10.heightBox,
                Text(
                  "Tic Tac Toe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]))),
    );
  }
}
