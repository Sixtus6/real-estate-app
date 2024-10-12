import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search, color: Colors.black54),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "Saint Petersburg",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.tune, color: Colors.black54),
              onPressed: () {
                // Action for the filter icon
              },
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
