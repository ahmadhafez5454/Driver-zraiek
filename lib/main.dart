import 'package:driverr/constant/string.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';
import 'constant/my_colors.dart';
import 'constant/shared_prefrenses.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp( DriverZreik(
    appRouter: AppRouter(),
  ));
}

class DriverZreik extends StatelessWidget {
  const DriverZreik({super.key, required this.appRouter});

  final AppRouter appRouter;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
            seedColor: MyColors.myYellow,
            onSecondary: MyColors.myGrey,
            onSurface: MyColors.myGrey,
            background: MyColors.myGrey),

        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}





