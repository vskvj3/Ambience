import 'package:ambience/screens/add_books.dart';
import 'package:ambience/widgets/book_card.dart';
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Choose One",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                crossAxisCount: 3,
                children: List.generate(
                  30,
                  (index) {
                    return BookCard(index: index.toString());
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addBooksDialog(context);
          },
          tooltip: "Add books",
          autofocus: true,
          isExtended: true,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> addBooksDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            // insetPadding:
            // const EdgeInsets.symmetric(vertical: -20, horizontal: 40),
            child: ButtonBar(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 60,
              buttonPadding: const EdgeInsets.symmetric(vertical: 50),
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddFromLocalStorage(),
                        ),
                      );
                    },
                    child: const Text("Local Storage")),
                ElevatedButton(onPressed: () {}, child: const Text("Youtube")),
                ElevatedButton(onPressed: () {}, child: const Text("Librevox")),
              ],
            ),
          );
        });
  }
}
