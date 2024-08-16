import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:driverr/data/model/upcoming_trip_model.dart';
import '../../constant/shared_prefrenses.dart';
import '../../constant/string.dart';

class UpcomingApi {
  Future<dynamic> upcomingapi() async {
    var headers = {
      'Accept': 'application/json',

      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}showDriversUpcomingTrips';
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
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
    );
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return UpcomingTravelModel.fromJson(response.data);
    } else {
      print(response.statusMessage);
    }
  }
}
