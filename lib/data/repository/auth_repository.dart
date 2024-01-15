import 'package:ewise/data/repository/login_email_password_failure.dart';
import 'package:ewise/data/repository/register_email_password_failure.dart';
import 'package:ewise/presentation/homepage/homepage_screen.dart';
import 'package:ewise/presentation/login/login_screen.dart';
import 'package:ewise/presentation/splash/splash_screen.dart';
import 'package:ewise/routes/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Stream<User?> get firebaseUserStream => _auth.authStateChanges();

  final _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser = Rx<User?>(null);

  var verificationId = ''.obs;

  User? get firebaseUser => _firebaseUser.value;
  String get getUserID => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);

    _firebaseUser.bindStream(_auth.authStateChanges());

    // Delay to allow time for Firebase initialization
    _auth.authStateChanges().listen((user) {
      _firebaseUser.value = user;
      setInitialScreen(user);
    });
  }

  setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const HomePageScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Wait for a short duration to allow _auth.currentUser to be updated
      await Future.delayed(const Duration(seconds: 1));

      if (_firebaseUser.value != null) {
        Get.offAll(() => const HomePageScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = RegisterWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = RegisterWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Wait for a short duration to allow _auth.currentUser to be updated
      await Future.delayed(const Duration(seconds: 1));
      if (_firebaseUser.value != null) {
        Get.offAll(() => const HomePageScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    setInitialScreen(null);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent to $email");
    } catch (e) {
      Get.snackbar("Error", "Failed to send password reset email: $e");
    }
  }

  Future<User?> loginUserWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          Get.offAll(() => const HomePageScreen());
          Get.snackbar('Success', 'Login Berhasil!!');
          return user;
        } else {
          Get.offNamed(Routes.login);
          return null;
        }
      } else {
        throw "Belum memilih akun Google";
      }
    } catch (error) {
      // Handle the error
      Get.snackbar("Google Login Error", "Failed to login with Google");
      return null;
    }
  }
}
