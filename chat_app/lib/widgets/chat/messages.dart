import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
        .collection('chat')
        .orderBy('createdAt', descending: true)
        .snapshots();
    return StreamBuilder(
      stream: _chatStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        //print(snapshot.data!.docs[0].reference.id);
        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            // Document Id
            //print(snapshot.data!.docs[0].reference.id);
            return ListTile(
              title: MessageBubble(
                message: data['text'],
                isMe: data['userId'] == FirebaseAuth.instance.currentUser!.uid,
                key: ValueKey(snapshot.data!.docs[0].reference.id),
                username: data['username'],
                userImage: data['userImage']
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
