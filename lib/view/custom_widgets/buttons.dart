import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool loading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? null
          : () {
              onPressed();
            },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 10, left: 10,),
        child: Container(
          height: 51,
          width: double.infinity,
          decoration: BoxDecoration(
            color: loading ? const Color(0xFFFF80A1) : const Color(0xFFE6446E),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
