import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Music Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auidoPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d5cf63100194625.5f03c01226780.gif'),
            ),
            Slider(value: 0, onChanged: (value) {}),
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await auidoPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await auidoPlayer.play(UrlSource(
                      'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3'));
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              icon: Icon(
                !isPlaying ? Icons.play_circle : Icons.pause_circle,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
