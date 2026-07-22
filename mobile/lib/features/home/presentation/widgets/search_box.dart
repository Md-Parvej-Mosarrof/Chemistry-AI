import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search chemistry topics...',
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(Icons.search, color: Theme.of(context).colorScheme.outline),
      ),
      elevation: MaterialStateProperty.all(1),
      backgroundColor: MaterialStateProperty.all(
        Theme.of(context).colorScheme.surface,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
    );
  }
}
