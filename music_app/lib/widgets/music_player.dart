import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/songs_model.dart';
import 'package:music_app/widgets/player_button_widget.dart';
import 'package:music_app/widgets/seekbar.dart';

class MusicPlayer extends StatelessWidget {
  MusicPlayer({
    super.key,
    required Stream<SeekBarData> seekbarDataStream,
    required this.songs,
    required this.audioPlayer,
  }) : _seekbarDataStream = seekbarDataStream;

  final Stream<SeekBarData> _seekbarDataStream;
  final Songs songs;
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songs.songName,
            style:
                GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            songs.songDes,
            style: GoogleFonts.ubuntu(),
          ),
          SizedBox(
            height: 40,
          ),
          StreamBuilder<SeekBarData>(
              stream: _seekbarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  postion: positionData?.position ?? Duration.zero,
                  audioPlayer: audioPlayer,
                );
              }),
          PlayerButtonWidget(
            audioPlayer: audioPlayer,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 45,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cloud_download,
                    color: Colors.white,
                    size: 45,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
