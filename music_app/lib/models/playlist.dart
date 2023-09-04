import 'package:music_app/models/songs_model.dart';

class PlayList {
  final String title;
  final List<Songs> songList;
  final String imgUrl;
  PlayList({required this.title, required this.imgUrl, required this.songList});

  static List<PlayList> playList = [
    PlayList(
        title: 'AG',
        imgUrl:
            'https://i.pinimg.com/736x/6c/8d/72/6c8d7271c96e5e6009f96c91c6a65c94.jpg',
        songList: Songs.songList),
    PlayList(
        title: 'Gym',
        imgUrl:
            'https://techiemore.com/wp-content/uploads/White-Black-Sport-Workout-Playlist-Cover.jpg',
        songList: Songs.songList),
    PlayList(
        title: 'Old Times',
        imgUrl:
            'https://i.pinimg.com/550x/7b/e6/f5/7be6f5d41a68233709523a6427d905ca.jpg',
        songList: Songs.songList),
  ];
}
