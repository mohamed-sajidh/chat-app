import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController searchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: "search",
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Image.asset(
            "assets/search_icon.png",
            height: 24,
            width: 24,
          )
        ],
      ),
    );
  }
}
