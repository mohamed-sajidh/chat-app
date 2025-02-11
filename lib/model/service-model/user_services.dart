import 'package:dio/dio.dart';

class UserServices {
  static String serverUrl = "http://192.168.29.231:8080";
  static Future<String?> addPhoneNumber(String phoneNumber) async {
    final dio = Dio();
    try {
      var data = {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {"phone": phoneNumber}
        }
      };

      final response = await dio.post(
        "$serverUrl/api/v1/auth/registration-otp-codes/actions/phone/send-otp",
        data: data,
      );

      print("response.statusCode ${response.statusCode}");

      if (response.statusCode == 200) {
        return null;
      } else {
        return response.data;
      }
    } on DioException catch (e) {
      return e.response?.data;
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }

  static Future<String?> verifyOtp(String phoneNumber, int otp) async {
    final dio = Dio();
    try {
      var data = {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {
            "phone": phoneNumber,
            "otp": otp,
            "device_meta": {
              "type": "web",
              "name": "HP Pavilion 14-EP0068TU",
              "os": "Linux x86_64",
              "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
              "browser_version": "112.0.2",
              "user_agent":
                  "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
              "screen_resolution": "1600x900",
              "language": "en-GB"
            }
          },
        }
      };

      final response = await dio.post(
        "$serverUrl/api/v1/auth/registration-otp-codes/actions/phone/verify-otp",
        data: data,
      );

      print("response.statusCode ${response.statusCode}");

      if (response.statusCode == 200) {
        return null;
      } else {
        return response.data;
      }
    } on DioException catch (e) {
      return e.response?.data;
    } catch (e) {
      return 'An unexpected error occurred';
    }
  }
}
