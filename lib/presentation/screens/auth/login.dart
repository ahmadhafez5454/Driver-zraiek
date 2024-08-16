import 'package:driverr/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../constant/my_colors.dart';
import '../../../constant/string.dart';

import '../../../constant/validate.dart';
import '../../../data/apis/login_api.dart';
import '../../../data/model/login_model.dart';
import '../widget/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.myBlack,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.myBlack, Color(0xff222222)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Image(
                height: 300,
                image: AssetImage("assets/images/big logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 12.0, left: 12.0, right: 12.0, top: 12.0),
                child: Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.myYellow, // لون الإطار
                        width: 1.0, // سمك الإطار
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xaaffffff)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 35),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "البريد الالكتروني المخصص للسائق",
                            style: TextStyle(fontFamily: "cairo"),
                          ),
                          TextFormField(
                            validator: emailValidator,
                            controller: emailController,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("كلمة المرور",
                              style: TextStyle(fontFamily: "cairo")),
                          TextFormField(
                            validator: passwordValidator,
                            controller: passwordController,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          LoginRequestModel loginRequestModel =
                                          LoginRequestModel(
                                              email: emailController.text,
                                              password:
                                              passwordController.text);

                                          if (await LoginApi().login(
                                              loginRequestModel:
                                              loginRequestModel)) {
                                            Navigator.of(context)
                                                .pushReplacementNamed(homeScreen);
                                          } else {
                                            flutterToast(
                                                msg:
                                                "username or pass is not true");
                                          }
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          "تسجيل الدخول",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
