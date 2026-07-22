import 'package:flutter/material.dart';

class HomeSearchBox extends StatelessWidget {
  const HomeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search chapters...',
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onTap: () {},
      onChanged: (_) {},
    );
  }
}
