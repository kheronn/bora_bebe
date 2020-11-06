import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User> _user = Rx<User>();
  set user(u) => this._user.value = u;
  User get user => this._user.value;

  @override
  void onInit() {
    super.onInit();
    print(user?.uid);
  }

  void loginGoogle() async {
    try {
      await Firebase.initializeApp();
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        Get.offAllNamed("/home");
      }
    } catch (e) {
      Get.snackbar("Erro ao logar", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void sair() async {
    try {
      await _auth.signOut();
      Get.offAllNamed("login");
    } catch (e) {
      Get.snackbar("Erro ao sair", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
