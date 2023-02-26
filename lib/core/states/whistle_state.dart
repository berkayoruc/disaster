import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class WhistleProvider with ChangeNotifier {
  bool _iswhistleOn = false;

  bool get iswhistleOn => _iswhistleOn;

  set iswhistleOn(bool value) {
    _iswhistleOn = value;
    notifyListeners();
  }
}

class PlayerProvider with ChangeNotifier {
  AudioPlayer _player = AudioPlayer();
  AudioPlayer get player => _player;
}
