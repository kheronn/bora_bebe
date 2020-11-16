import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  NotificationService() {
    iniciaizar();
    print("chamou o inicializar");
  }

  final FirebaseMessaging firebaseMessage = FirebaseMessaging();

  Future iniciaizar() async {
    firebaseMessage.configure(
      onMessage: (Map<String, dynamic> message) async {
        Get.defaultDialog(
            title: "Nova promoção", radius: 30, middleText: message.toString());
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
