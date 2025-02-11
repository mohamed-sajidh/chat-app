import 'package:chat_app/controller/phone_number_controller.dart';
import 'package:chat_app/view/custom_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController countryCodeController = TextEditingController();
    late TextEditingController phoneNumberController = TextEditingController();
    final PhoneNumberController controller = Get.put(PhoneNumberController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => print("haii"),
            icon: const Icon(Icons.arrow_back_sharp)),
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
                "Enter your phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        Image.asset("assets/Phone.png"),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextFormField(
                            controller: countryCodeController,
                            decoration: InputDecoration(
                              hintText: "+91",
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Phone Number Field
                  Expanded(
                    child: TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child:
                  Text("Fliq will send you a text with a verification code."),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomButton(
          text: "Next",
          onPressed: () => controller.addPhoneNumber(
            countryCodeController.text,
            phoneNumberController.text,
            context,
          ),
          loading: controller.isLoading.isTrue,
        ),
      ),
    );
  }
}
