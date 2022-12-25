import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/resources/jitsi_meet_methods.dart';
import 'package:minestream/widgets/home_meeting_button.dart';
import 'package:minestream/widgets/new_conference_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          NewConferenceButton(onPressed: createNewMeeting),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                  text: "Join Meeting",
                  iconData: Icons.video_camera_front_rounded,
                  onPressed: () => joinMeeting(context)),
              HomeMeetingButton(
                  text: "Schedule",
                  iconData: Icons.calendar_month,
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 20),
          HomeMeetingButton(
              text: "Screen Share",
              iconData: Icons.screen_share_rounded,
              onPressed: () {}),
        ],
      ),
    );
  }
}
