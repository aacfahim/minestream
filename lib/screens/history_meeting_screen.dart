import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:minestream/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  HistoryMeetingScreen({super.key});
  final f = DateFormat('dd-MM-yyyy hh:mm');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            final Timestamp timestamp =
                (snapshot.data! as dynamic).docs[index]['createdAt'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                    "Room Name ${(snapshot.data! as dynamic).docs[index]['meetingName']}"),
                subtitle: Text("Joined on ${DateFormat.yMMMMEEEEd().format(
                  (snapshot.data! as dynamic).docs[index]['createdAt'].toDate(),
                )}"),
              ),
            );
          },
        );
      },
    );
  }
}
