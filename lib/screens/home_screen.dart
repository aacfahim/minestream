import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/utils/colors.dart';
import 'package:minestream/widgets/home_meeting_button.dart';
import 'package:minestream/widgets/new_conference_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Hi, ${_auth.currentUser!.displayName!.split(' ')[0]} 👋",
              style: TextStyle(fontSize: 26),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(_auth.currentUser!.photoURL!),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onPageChanged,
            currentIndex: _page,
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment_bank), label: "Conversations"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.meeting_room_outlined), label: "Meetings"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts), label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Preferences"),
            ]),
        body: Center(
          child: Column(
            children: [
              NewConferenceButton(
                onPressed: (() {}),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeMeetingButton(
                      text: "Join Meeting",
                      iconData: Icons.video_camera_front_rounded,
                      onPressed: () {}),
                  HomeMeetingButton(
                      text: "Schedule",
                      iconData: Icons.calendar_month,
                      onPressed: () {}),
                ],
              ),
              SizedBox(height: 20),
              HomeMeetingButton(
                  text: "Schedule",
                  iconData: Icons.screen_share_rounded,
                  onPressed: () {}),
            ],
          ),
        ));
  }
}
