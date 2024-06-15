import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  //audio player
  final _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //construtor
  AudioProvider() {
    listenToDuration();
  }
  //initially not playing
  bool _isPlaying = false;

  //set the source
  void setSource(String url) {
    _audioPlayer.setUrl(url);
    playsong();
  }

  //play the song
  void playsong() async {
    await _audioPlayer.stop();
    await _audioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
  //play the next song

  //play the previous song

  //list to duration
  void listenToDuration() {
//listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

//listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

//listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {});
  }

  //dispose audio player

  //GETTERS

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
}
