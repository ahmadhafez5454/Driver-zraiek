import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseUrl = 'http://192.168.1.106:8000/driver/';

//routes
const String homeScreen = '/homescreen';
const String loginScreen = '/loginscreen';
const String splashScreen = '/splash';
const String inprogresstap = '/inprogress';



//screen dimensions
final double physicalHeight =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
final double physicalWidth =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;

final double devicePixelRatio =
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

final double myScreenHeight = physicalHeight / devicePixelRatio;
final double myScreenWidth = physicalWidth / devicePixelRatio;
