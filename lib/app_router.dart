import 'package:driverr/presentation/screens/auth/login.dart';
import 'package:driverr/presentation/screens/home/home_screen.dart';
import 'package:driverr/presentation/screens/home/home_tap/inprogress_tap.dart';
import 'package:driverr/presentation/splash_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant/string.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case homeScreen:
      return MaterialPageRoute(builder: (_) => HomeScreen());

      case inprogresstap:
        return MaterialPageRoute(builder: (_) => InprogressTap());


    }
    return null;
  }
}

