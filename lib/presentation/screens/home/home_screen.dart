import 'package:driverr/constant/my_colors.dart';
import 'package:driverr/presentation/screens/home/home_tap/inprogress_tap.dart';
import 'package:driverr/presentation/screens/home/home_tap/logout_tap.dart';
import 'package:driverr/presentation/screens/home/home_tap/upcoming_tap.dart';

import 'package:flutter/material.dart';

import 'home_tap/finish_tap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;
  final pages = [UpcomingTrip(), InprogressTap(), FinishTap(),LogoutTap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: ClipRect(

        child: NavigationBar(
          animationDuration: Duration(milliseconds: 40),

          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),


          height: 65,
          backgroundColor: MyColors.myYellow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, size: 30,),
              label: 'الرحلات المجدولة',
            ),
            NavigationDestination(
              icon: Icon(Icons.fact_check),
              selectedIcon: Icon(Icons.fact_check, size: 30,),
              label: 'الرحلات الحالية',
            ),
            NavigationDestination(
              icon: Icon(Icons.update),
              selectedIcon: Icon(Icons.update, size: 30,),
              label: 'الرحلات المنتهية',
            ),
            NavigationDestination(
              icon: Icon(Icons.logout),
              selectedIcon: Icon(Icons.logout, size: 30,),
              label: 'تسجيل الخروج',
            ),

          ],
        ),
      ),
    );
  }
}
