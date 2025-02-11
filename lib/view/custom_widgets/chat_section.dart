import 'package:flutter/material.dart';

class ChatSection extends StatelessWidget {
  const ChatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          height: 70,
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.asset("assets/sample_img.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Regina Bearden",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Send an Image",
                    style: TextStyle(
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 120,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10.00 AM",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  // Text(
                  //   "Send an Image",
                  //   style: TextStyle(
                  //     color: Color(0xFF4A90E2),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 8,
      ),
    );
  }
}
