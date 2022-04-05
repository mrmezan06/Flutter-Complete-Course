import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message, required this.isMe})
      : super(key: key);

  final String message;
  final bool isMe;
  

  @override
  Widget build(BuildContext context) {
    return Row(
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
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.black.withOpacity(.7) : Colors.white,
              ),
            )),
      ],
    );
  }
}
