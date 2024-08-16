import 'package:driverr/presentation/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constant/my_colors.dart';
import '../../../../data/apis/logout_api.dart';

class LogoutTap extends StatelessWidget {
  const LogoutTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [MyColors.myBlack, Color(0xff222222)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left:  1),
                child: Text("هل ترغب فعلا بالمغادرة من التطبيق؟",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.myBlack,
                          borderRadius:
                          BorderRadiusDirectional.circular(8)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                          color: MyColors.myBlack,
                          onPressed: (){
    LogoutApi().logout();
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>  LoginScreen()));
    },

                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "غادر",
                              style: TextStyle(
                                  fontFamily: "cairo",
                                  color: MyColors.myYellow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
