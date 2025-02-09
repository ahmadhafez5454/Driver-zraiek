import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constant/my_colors.dart';
import '../../constant/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2),() {
      Navigator.of(context).pushReplacementNamed(loginScreen);
    });
    super.initState();
  }
  @override
  void dispose() {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:
    SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myBlack,
        body: Center(
            child: const Image(image: AssetImage("assets/images/logo.png"),).animate( onPlay: (controller) => controller.repeat(),).fadeIn(duration: 1200.ms).then().fadeOut(duration: 1200.ms)
        )
    );
  }
}
