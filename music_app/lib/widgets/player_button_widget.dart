import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/songs_model.dart';

class PlayerButtonWidget extends StatelessWidget {
  PlayerButtonWidget({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  final List<Songs> songs = Songs.songList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed: () {
                  Get.toNamed('song', arguments: songs[6]);
                  audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null;
                },
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                ),
                iconSize: 45,
              );
            }),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState = playerState!.processingState;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    height: 64.0,
                    width: 64.0,
                    child: CircularProgressIndicator(),
                  );
                } else if (!audioPlayer.playing) {
                  return IconButton(
                    iconSize: 75,
                    onPressed: audioPlayer.play,
                    icon: Icon(Icons.play_circle),
                    color: Colors.white,
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    iconSize: 75,
                    onPressed: audioPlayer.pause,
                    icon: Icon(Icons.pause_circle),
                    color: Colors.white,
                  );
                } else {
                  return IconButton(
                    iconSize: 75,
                    onPressed: () => audioPlayer.seek(Duration.zero,
                        index: audioPlayer.effectiveIndices!.first),
                    icon: Icon(Icons.replay_circle_filled_outlined),
                    color: Colors.white,
                  );
                }
              } else {
                return CircleAvatar();
              }
            }),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed: () {
                  // audioPlayer.hasNext ? audioPlayer.seekToNext : null;
                  audioPlayer.seekToNext();
                  Get.toNamed('song', arguments: songs[5]);
                },
                icon: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
                iconSize: 45,
              );
            }),
      ],
    );
  }
}
