import 'package:dio/dio.dart';

import '../../constant/shared_prefrenses.dart';
import '../../constant/string.dart';

class UpdateStatuesApi{

  Future<void> updateTripStatus(int tripId) async {
    var headers = {
      'Accept': 'application/json',
      'data': {'tripId': tripId},
      'Authorization': 'Bearer ${Prefs.getToken()}',
    };
    var dio = Dio();
    String url = '${baseUrl}updateTripStatus/$tripId';
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
    );
    if (response.statusCode == 200) {
      print("Trip status updated successfully");
    } else {
      print("Failed to update trip status: ${response.statusMessage}");
    }
  }

}