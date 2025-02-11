import 'package:chat_app/view/custom_widgets/chat_section.dart';
import 'package:chat_app/view/custom_widgets/message_bottom_bar.dart';
import 'package:chat_app/view/custom_widgets/message_icons.dart';
import 'package:chat_app/view/custom_widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Text(
          "Messages",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 15, right: 15),
        child: Column(
          children: [
            MessageIcons(),
            SizedBox(
              height: 20,
            ),
            Searchbar(),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Chat",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ChatSection(),
          ],
        ),
      ),

      bottomNavigationBar: const MessageBottomBar(),
    );
  }
}
