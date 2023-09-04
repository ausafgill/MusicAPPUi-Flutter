import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/models/songs_model.dart';
import 'package:music_app/widgets/bottom_nav_bar.dart';
import 'package:music_app/widgets/playlistcard.dart';
import 'package:music_app/widgets/trending_songs_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Songs> songList = Songs.songList;
  List<PlayList> playList = PlayList.playList;
  TextEditingController searchBar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            leading: Icon(Icons.grid_view_rounded),
            backgroundColor: Colors.transparent,
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1557933488-c8daa2a5772c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
                ),
              )
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enjoy Your Favourite Music',
                    style: GoogleFonts.ubuntu(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: searchBar,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        hintStyle: GoogleFonts.ubuntu(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending Music',
                        style: GoogleFonts.ubuntu(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View More',
                        style: GoogleFonts.ubuntu(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TrendingSongSlider(songList: songList),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PlayList',
                        style: GoogleFonts.ubuntu(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View More',
                        style: GoogleFonts.ubuntu(),
                      ),
                    ],
                  ),
                  PlayListCard(playList: playList)
                ],
              ),
            ),
          ),
        ));
  }
}
