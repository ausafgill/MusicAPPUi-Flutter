import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/songs_model.dart';
import 'package:music_app/widgets/backgroundfilter.dart';
import 'package:music_app/widgets/music_player.dart';
import 'package:music_app/widgets/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  Songs song = Get.arguments ?? Songs.songList[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(
        Uri.parse(
          'asset:///${song.songUrl}',
        ),
      ),
      // AudioSource.uri(
      //   Uri.parse(
      //     'asset:///${Songs.songList[2].songUrl}',
      //   ),
      // ),
    ]));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  Stream<SeekBarData> get _seekbarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.songCover,
            fit: BoxFit.cover,
          ),
          BackgroundFilter(),
          MusicPlayer(
            songs: song,
            seekbarDataStream: _seekbarDataStream,
            audioPlayer: audioPlayer,
          ),
        ],
      ),
    );
  }
}
