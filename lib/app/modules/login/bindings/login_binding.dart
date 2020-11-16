import 'package:bora_bebe/app/data/providers/auth_service.dart';
import 'package:bora_bebe/app/data/providers/ibge_api.dart';
import 'package:bora_bebe/app/data/providers/notification_service.dart';
import 'package:get/get.dart';

import 'package:bora_bebe/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut(() => APIs(), fenix: true);
    Get.lazyPut(() => AuthService(), fenix: true);
    Get.lazyPut(() => NotificationService());
  }
}
