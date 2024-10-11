import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flick_pulse/constant/lottie_constant.dart';
import 'package:flick_pulse/constant/spacing_constant.dart';
import 'package:flick_pulse/screens/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MovieScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Lottie.asset(LottieConstant.splashAnimation,
                  animate: true, repeat: false),
            ),
            const Text(
              'By Aflah Alifu',
              style: TextStyle(
                color: ColorConstant.fourthColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SpacingConstant.verticalSpacing200,
          ],
        ),
      ),
    );
  }
}
