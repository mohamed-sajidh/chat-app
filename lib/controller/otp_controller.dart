import 'package:chat_app/model/service-model/user_services.dart';
import 'package:chat_app/view/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> verifyOtp(
    phoneNumber,
    otp,
    BuildContext context,
  ) async {
    try {
      isLoading(true);

      int enteredOtp = int.parse(otp);
      String? errorMessage =
          await UserServices.verifyOtp(phoneNumber, enteredOtp);

      if (errorMessage == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Otp has sent to your email id"),
            ),
          );
        }
        Get.to(() => const MessageScreen());
      } else {
        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Phone Number is not correct',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
