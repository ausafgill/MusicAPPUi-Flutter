import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/playlist.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    super.key,
    required this.playList,
  });

  final List<PlayList> playList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: playList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('playlist', arguments: playList[index]);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade800.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                playList[index].imgUrl,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playList[index].title,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${playList[index].songList.length.toString()} Songs',
                                    style: GoogleFonts.ubuntu(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ))
                      ],
                    )),
              );
            })
      ],
    );
  }
}
