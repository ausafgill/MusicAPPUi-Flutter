import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/songs_model.dart';

class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({
    super.key,
    required this.songList,
  });

  final List<Songs> songList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: CarouselSlider.builder(
        itemCount: songList.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(seconds: 1),
          enlargeCenterPage: true,
          viewportFraction: 0.55,
          pageSnapping: true,
        ),
        itemBuilder: (context, index, PageViewIndex) {
          return Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        songList[index].songCover,
                      ))),
            ),
            SongCard(songList: songList[index]),
          ]);
        },
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.songList,
  });

  final Songs songList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: songList);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.37,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 5),
              child: Column(
                children: [
                  Text(
                    songList.songName,
                    style: GoogleFonts.ubuntu(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    songList.songDes,
                    style: GoogleFonts.ubuntu(color: Colors.white),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.play_circle,
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
