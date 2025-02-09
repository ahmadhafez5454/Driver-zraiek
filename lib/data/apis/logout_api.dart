import 'package:dio/dio.dart';
import '../../constant/shared_prefrenses.dart';
import '../../constant/string.dart';
import '../../presentation/screens/widget/toast.dart';

class LogoutApi {
  Future logout() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Prefs.getToken()}',

    };
    var dio = Dio();
    String url = '${baseUrl}logout';

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
      print("Driver logout *_*");
      return true;
    } else {
      if (response.data['message'] != null) {
        flutterToast(msg: response.data['message'].toString());
      }
    }
  }
}
