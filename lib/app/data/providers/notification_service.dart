import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  final FirebaseMessaging firebaseMessage = FirebaseMessaging.instance;

  Future inicilizar() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.defaultDialog(
          title: message.notification.title,
          radius: 30,
          middleText: message.notification.body,
          textConfirm: 'OK');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    //await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
}
