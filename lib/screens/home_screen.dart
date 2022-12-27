import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/resources/auth_methods.dart';
import 'package:minestream/screens/history_meeting_screen.dart';
import 'package:minestream/screens/meeting_screen.dart';
import 'package:minestream/utils/colors.dart';
import 'package:minestream/widgets/custom_button.dart';
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

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    CustomButton(
        text: "Logout",
        onPressed: () {
          AuthMethods().signOut();
        })
  ];

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
            style: TextStyle(fontSize: 20),
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
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Meetings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_rounded), label: "Logout"),
          ]),
      body: pages[_page],
    );
  }
}
