import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minestream/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final IconData? iconData;
  final String text;
  final VoidCallback onPressed;

  const HomeMeetingButton(
      {super.key, this.iconData, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff4696F1),
                  Color(0xff74D0FA),
                  Color(0xff80DDFC),
                ])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(iconData),
            Text(text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ]),
        ),
      ),
    );
  }
}
