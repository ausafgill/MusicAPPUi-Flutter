import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/models/songs_model.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    List<Songs> songs = Songs.songList;
    int getRandomNum() {
      Random random = Random();
      int randomNumber = random.nextInt(8);
      return randomNumber;
    }

    return BottomNavigationBar(
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    int randomNum = getRandomNum();
                    Get.toNamed('song', arguments: songs[randomNum]);
                  },
                  child: Icon(Icons.play_circle)),
              label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Profile')
        ]);
  }
}
