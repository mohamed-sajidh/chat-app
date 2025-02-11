import 'package:chat_app/model/service-model/user_services.dart';
import 'package:chat_app/view/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> addPhoneNumber(
    countryCode,
    phoneNumber,
    BuildContext context,
  ) async {
    try {
      isLoading(true);
      String fullNumber = "$countryCode$phoneNumber";
      print("phone number ==> $fullNumber");

      String? errorMessage = await UserServices.addPhoneNumber(fullNumber);

      if (errorMessage == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Otp has sent to your email id"),
            ),
          );
        }
        Get.to(() => OtpScreen(
              enteredNumber: fullNumber,
            ));
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
