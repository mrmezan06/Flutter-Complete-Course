import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enteredMessage = '';
  void _sendMessage() async {
    // Close the keyboard
    FocusScope.of(context).unfocus();
    //Getting UserId
    final user = FirebaseAuth.instance.currentUser!;
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    // Data send to firestore
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url'],
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'Send a message...'),
          onChanged: (value) {
            setState(() {
              _enteredMessage = value;
            });
          },
        )),
        IconButton(
          onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          icon: const Icon(
            Icons.send,
            color: Colors.pink,
          ),
          color: Theme.of(context).primaryColor,
        )
      ]),
    );
  }
}
