import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.inversePrimary),
        height: 70,
        width: 40,
      ),
    );
  }
}
