import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _playerId = [];

  void _getPlayerID() async {
    var _userStream =
        await FirebaseFirestore.instance.collection('users').get();
    if (_userStream.docs.isNotEmpty) {
      for (var doc in _userStream.docs) {
        //without '.data()' because you have it in your model.
        setState(() {
          _playerId.add(doc['onesignalId']);
        });
      }
    }
  }

  final _controller = TextEditingController();
  var _enteredMessage = '';
  void _sendMessage() async {
    // Getting PlayerId for notification
    var deviceState = await OneSignal.shared.getDeviceState();

    if (deviceState == null || deviceState.userId == null) {
      return;
    }
    _getPlayerID();

    var playerId = deviceState.userId!;

    // Close the keyboard
    FocusScope.of(context).unfocus();
    //Getting UserId
    final user = FirebaseAuth.instance.currentUser!;

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    // Data send to firestore
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url'],
    });
    _controller.clear();

    // Collect Others PlayerId
    for (var player in _playerId) {
      if (player != playerId) {
        _handleSendNotification(player, _enteredMessage, userData['username'],
            userData['image_url']);
      }
    }

    // Check PlayerID between your and other
  }

  // OneSignal Notification Send

  void _handleSendNotification(playerId, msg, username, imgUrl) async {
    //var deviceState = await OneSignal.shared.getDeviceState();

    // if (deviceState == null || deviceState.userId == null) {
    //   return;
    // }

    // var playerId = deviceState.userId!;

    var notification = OSCreateNotification(
      playerIds: [playerId],
      content: msg,
      heading: username,
      iosAttachments: {"id1": imgUrl},
      bigPicture: imgUrl,
    );

    var response = await OneSignal.shared.postNotification(notification);

    print(response.toString());
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
