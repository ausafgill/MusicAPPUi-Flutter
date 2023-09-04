import 'package:flutter/material.dart';

class Songs {
  final String songName;
  final String songCover;
  final String songUrl;
  final String songDes;

  Songs(
      {required this.songName,
      required this.songUrl,
      required this.songCover,
      required this.songDes});

  static List<Songs> songList = [
    Songs(
        songName: 'Gonna Be Okay',
        songUrl: 'assets/songs/gonnabeokay.mp3',
        songCover: 'assets/images/gonnabeokay.jpg',
        songDes: 'Brent Morgan'),
    Songs(
        songName: 'Let Me Love You',
        songUrl: 'assets/songs/letmeloveyou.mp3',
        songCover: 'assets/images/letmeloveyou.jpg',
        songDes: 'Justin Bieber'),
    Songs(
        songName: 'Glimpses of US',
        songUrl: 'assets/songs/glimpsesofus.mp3',
        songCover: 'assets/images/glimpsesofus.jpg',
        songDes: 'Joji'),
    Songs(
        songName: 'Mocking Bird',
        songUrl: 'assets/songs/mockingbird.mp3',
        songCover: 'assets/images/mockingbird.jpg',
        songDes: 'Eminem'),
    Songs(
        songName: 'Perfect',
        songUrl: 'assets/songs/perfect.mp3',
        songCover: 'assets/images/perfect.jpg',
        songDes: 'Ed Sheeren'),
    Songs(
        songName: 'Until I Found You',
        songUrl: 'assets/songs/untilifoundyou.mp3',
        songCover: 'assets/images/untilifoundyou.jpg',
        songDes: 'Stephen Sanchez'),
    Songs(
        songName: 'Do Raazi',
        songUrl: 'assets/songs/raazi.mp3',
        songCover: 'assets/images/doraazi.jpg',
        songDes: 'Kumar Sanu'),
  ];
}
