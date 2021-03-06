import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future singUp(String email, String password) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = cred.user;
    return user;
  }

  Future logIn(String email, String password) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = cred.user;
    return user;
  }

  Future logOut() async {
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    return await _auth.signOut();
  }

  Future singUpFacebook() async {
    final facebookLogin = FacebookLogin();
    User user;

    final result = await facebookLogin.logIn(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        AuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken.token);
        UserCredential cred = await _auth.signInWithCredential(credential);
        user = cred.user;
        return user;
      case FacebookLoginStatus.cancelledByUser:
        print("El usuario cancelo");
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }

  Future singUpGoogle() async {
    User user;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    UserCredential cred = await _auth.signInWithCredential(credential);
    user = cred.user;
    return user;
  }
}
