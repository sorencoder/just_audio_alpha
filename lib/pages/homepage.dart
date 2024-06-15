import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music/pages/song_page.dart';
import 'package:music/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void gotoSong(String title, String artist, String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) =>
                SongPage(title: title, artist: artist, url: url))));
    Provider.of<AudioProvider>(context, listen: false).setSource(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('songs').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> songs =
                        snapshot.data!.docs[index].data();
                    return InkWell(
                      onTap: () {
                        gotoSong(songs['title'], songs['artist'], songs['url']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Card(
                          child: ListTile(
                            title: Text(songs['title']),
                            subtitle: Text(songs['artist']),
                            leading: const CircleAvatar(),
                            trailing: InkWell(
                                onTap: () {},
                                child: const Icon(
                                    Icons.play_circle_outline_rounded)),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          }),
    );
  }
}
