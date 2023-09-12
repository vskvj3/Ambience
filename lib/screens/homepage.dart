import 'package:audiobook_player/widgets/book_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Library",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return const BookCard();
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Add books",
          autofocus: true,
          isExtended: true,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
