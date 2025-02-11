import 'package:flutter/material.dart';

class MessageBottomBar extends StatelessWidget {
  const MessageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        right: 10,
        left: 10,
      ),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8.0, bottom: 8.0),
          child: Row(
            children: [
              Image.asset("assets/home.png")
            ],
          ),
        ),
      ),
    );
  }
}
