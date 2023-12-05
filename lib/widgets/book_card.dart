import 'package:ambience/screens/playpage.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String index;
  const BookCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PlayScreen(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.transparent,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffDDDDDD),
                  blurRadius: 1.0,
                  spreadRadius: 0.50,
                  offset: Offset(0.0, 0.0),
                )
              ],
              image: DecorationImage(
                image: AssetImage("assets/images/testcovers/$index.jpg"),
                fit: BoxFit.contain,
                onError: (exception, stackTrace) {},
              ),
            ),
            height: 0,
            width: 0,
          ),
        ),
      ),
    );
  }
}
