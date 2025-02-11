import 'package:flutter/material.dart';

class MessageIcons extends StatelessWidget {
  const MessageIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(20, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset("assets/sample_img.png"),
                  ),
                  const Text(
                    "Christina",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
