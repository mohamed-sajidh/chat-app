import 'package:chat_app/controller/otp_controller.dart';
import 'package:chat_app/view/custom_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  final String enteredNumber;
  const OtpScreen({super.key, required this.enteredNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<String> otpValues = List.generate(6, (_) => '');
  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Enter your verification",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(widget.enteredNumber),
                InkWell(
                  onTap: () => print("edit button"),
                  child: const Text(
                    ".Edit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 53,
                  height: 40,
                  child: Center(
                    child: TextFormField(
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        counterText: '',
                        errorStyle: const TextStyle(height: 0.1),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD5CFD0),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            otpValues[index] = value;
                          });
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Didn’t get anything? No worries, let’s try again.",
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Resend",
                style: TextStyle(
                  color: Color(0xFF4A90E2),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        String otp = otpValues.join();
        return CustomButton(
          text: "Verify",
          onPressed: () => controller.verifyOtp(
            widget.enteredNumber,
            otp,
            context,
          ),
          loading: controller.isLoading.isTrue,
        );
      }),
    );
  }
}
