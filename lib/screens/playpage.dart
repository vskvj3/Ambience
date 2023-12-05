import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPositon) {
      setState(() {
        position = newPositon;
      });
    });
  }

  Future setAudio() async {
    String url =
        'https://www.chosic.com/wp-content/uploads/2020/07/the-epic-2-by-rafael-krux(chosic.com).mp3';
    audioPlayer.setSourceUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.squarespace-cdn.com/content/v1/5d253c231b7b3d000152f204/1636959802830-AW7JAWUJGCXXUYVIZC3J/Pride_and_Prejudice_Cover-Amazon-Front__77495.1569338564.386.513.jpg',
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Pride and Prejudice",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Jane Austen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(position.toString().substring(2, 7)),
                    Text(duration.toString().substring(2, 7)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      // Source url = UrlSource(
                      //     'https://www.chosic.com/wp-content/uploads/2020/07/the-epic-2-by-rafael-krux(chosic.com).mp3');
                      await audioPlayer.resume();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
