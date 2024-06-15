import 'package:flutter/material.dart';
import 'package:music/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
        songName: 'songName 1',
        artistName: 'artistName',
        albhumArt: 'albhumArt',
        audioUrl: 'audioUrl'),

    //song 2
    Song(
        songName: 'songName 2',
        artistName: 'artistName',
        albhumArt: 'albhumArt',
        audioUrl: 'audioUrl'),

    //song 3
    Song(
        songName: 'songName 3',
        artistName: 'artistName',
        albhumArt: 'albhumArt',
        audioUrl: 'audioUrl'),
  ];
  //current song playing index
  int? _currentSongIndex;

  /* 
  GETTERS
  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /* 
  SETTERS
  */
  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;

    //update UI
    notifyListeners();
  }
}
