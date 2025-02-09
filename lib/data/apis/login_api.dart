import 'dart:convert';
import 'package:dio/dio.dart';
import '../../constant/shared_prefrenses.dart';
import '../../constant/string.dart';
import '../model/login_model.dart';

class LoginApi {
  Future<bool> login({required LoginRequestModel loginRequestModel}) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var data = loginRequestModel.toJson();
    var dio = Dio();
    String url = '${baseUrl}login';
    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: headers,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 401) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
      ),
      data: data,
    );

    if (response.statusCode == 201) {
      print(json.encode(response.data));

      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response.data);

      var aa = loginResponseModel.data;
      Prefs.setToken(aa);
      return true;
    } else {
      print(response.statusMessage);
      return false;
    }
  }
}
