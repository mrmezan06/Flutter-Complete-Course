import 'package:chat_app/widgets/chat/messages.dart';
import 'package:chat_app/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {

          OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
            // Will be called whenever a notification is received in foreground
            // Display Notification, pass null param for not displaying the notification
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  // content: Text(event.notification.title.toString())));
                  // event.complete(event.notification);                                 
          });

          OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
            // Will be called whenever a notification is opened/button pressed.
            
          });

          OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
              // Will be called whenever the permission changes
              // (ie. user taps Allow on the permission prompt in iOS)
          });

          OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
              // Will be called whenever the subscription changes 
              // (ie. user gets registered with OneSignal and gets a user ID)
          });

          OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
              // Will be called whenever then user's email subscription changes
              // (ie. OneSignal.setEmail(email) is called and the user gets registered
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
          child: Column(
        children: const [
          Expanded(child: Messages()),
          NewMessage(),
        ],
      )),
    );
  }
}
