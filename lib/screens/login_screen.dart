import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/resources/auth_methods.dart';
import 'package:minestream/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "SEATBACK & JOIN",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Image.asset("assets/images/minestream_logo_white.png"),
        ),
        CustomButton(
          text: "Sign in using Google",
          onPressed: () async {
            bool res = await _authMethods.signInWithGoogle(context);
            if (res == true) {
              Navigator.pushNamed(context, '/home');
            } else {
              // nothing
            }
          },
        )
      ]),
    );
  }
}
