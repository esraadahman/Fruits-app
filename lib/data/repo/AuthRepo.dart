import 'package:fruits_app/Core/commonImports/commonImports.dart';

class Authrepo {
  // for user accounts
  static final FirebaseAuth _auth = FirebaseAuth.instance;
// for date store
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/* If you need real-time updates on authentication state (e.g., handling sign-out or token expiration), use StreamBuilder.
If you just need a one-time check at app startup and don't care about real-time updates, .**/
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  static Future<bool> signInWithGoogle(BuildContext context) async {
    bool isSignedIn = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential usercredential =
          await _auth.signInWithCredential(credential);

      User? user = usercredential.user;
      if (user != null) {
        // user create account right now (first time to sign up)

        if (usercredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection("users").doc(user.uid).set({
            "userName": user.displayName,
            "uid": user.uid,
            "profilePhoto": user.photoURL,
          });
        }
        isSignedIn = true;
      }
    } on FirebaseAuthException catch (e) {
      isSignedIn = false;
      //  showSnackBar(context, e.message!);
      print(e.toString());
    }
    return isSignedIn;
  }
}
