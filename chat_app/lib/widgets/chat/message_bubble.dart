import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.message,
      required this.isMe,
      required this.username,
       required this.userImage})
      : super(key: key);

  final String message;
  final String username;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: isMe ? Colors.grey[300] : Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: !isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(12),
                      bottomRight: isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(12))),
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe ? Colors.black.withOpacity(.7) : Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.black.withOpacity(.7) : Colors.white,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              )),
        ],
      ),
      Positioned(
        top: 0,
        left: isMe ? null : 120,
        right: isMe ? 120 : null,
        child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        )
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
