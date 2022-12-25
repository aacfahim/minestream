import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/resources/auth_methods.dart';
import 'package:minestream/utils/colors.dart';
import 'package:minestream/widgets/custom_button.dart';
import 'package:minestream/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  _joinMeeting() {}

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text("Join a Meeting"),
        centerTitle: true,
      ),
      body: Column(children: [
        TextField(
          controller: meetingIdController,
          maxLines: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Enter Room ID',
              contentPadding: EdgeInsets.all(16)),
        ),
        SizedBox(height: 10),
        TextField(
          controller: nameController,
          maxLines: 1,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16)),
        ),
        SizedBox(height: 20),
        CustomButton(onPressed: _joinMeeting, text: "Join"),
        SizedBox(height: 20),
        MeetingOption(
            text: "Mute audio", isMute: isAudioMuted, onChange: onAudioMuted),
        MeetingOption(
            text: "Turn off video",
            isMute: isVideoMuted,
            onChange: onVideoMuted)
      ]),
    );
  }
}
