import 'package:flutter/material.dart';
import 'package:music/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  final String title;
  final String artist;
  final String url;
  const SongPage(
      {super.key,
      required this.title,
      required this.artist,
      required this.url});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal),
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.artist,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('0:00'), Text('3:20')],
                  ),
                ),
                Slider(
                  value: value.currentDuration.inSeconds.toDouble(),
                  min: 0,
                  max: value.totalDuration.inSeconds.toDouble(),
                  onChanged: (double double) {},
                  onChangeEnd: (double double) {
                    value.seek(Duration(seconds: double.toInt()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    IconButton(
                        onPressed: () {
                          value.pauseOrResume();
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
