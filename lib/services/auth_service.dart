import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // EMAIL SIGN UP
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // EMAIL LOGIN
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // GOOGLE LOGIN (NEW VERSION)
  Future<User?> signInWithGoogle() async {
    try {

      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser =
      await googleSignIn.authenticate();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential result =
      await _auth.signInWithCredential(credential);

      return result.user;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // APPLE LOGIN
  Future<User?> signInWithApple() async {
    try {

      final appleCredential =
      await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential result =
      await _auth.signInWithCredential(oauthCredential);

      return result.user;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

}