import 'package:chat_app/widgets/chat/messages.dart';
import 'package:chat_app/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('chats/E7rtEISpcscWSJBYo3QO/messages')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat UI'),
        actions: [
          DropdownButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            items: [
              DropdownMenuItem(
                child: Row(children: const [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Logout')
                ]),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(child: 
      Column(
        children: const [
        Expanded(
          child: Messages()
          ),
          NewMessage(),
      ],
      )
      ) ,
    );
  }
}
