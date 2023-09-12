import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(""),
        ),
        body: const Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              BookCover(),
              SizedBox(
                height: 50,
              ),
              ControlButtons(),
              LinearProgressIndicator(
                value: 0.2,
                semanticsLabel: "hello",
                semanticsValue: "hello",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookCover extends StatelessWidget {
  const BookCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            alignment: Alignment.center,
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(0),
            child: const Text("items"))
      ],
    );
  }
}

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.skip_previous,
              size: 30,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_fill,
              size: 50,
            )),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            size: 30,
          ),
        ),
      ],
    );
  }
}
