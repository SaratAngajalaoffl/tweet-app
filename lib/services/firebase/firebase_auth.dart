import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // Future<User> signInWithGitHub() async {
  //   final GitHubSignIn gitHubSignIn = GitHubSignIn(
  //       clientId: clientId,
  //       clientSecret: clientSecret,
  //       redirectUrl: redirectUrl);
  //   var result = await gitHubSignIn.signIn(context);
  //   switch (result.status) {
  //     case GitHubSignInResultStatus.ok:
  //       print(result.token)
  //       break;

  //     case GitHubSignInResultStatus.cancelled:
  //     case GitHubSignInResultStatus.failed:
  //       print(result.errorMessage);
  //       break;
  //   }
  // }

  Future<UserCredential> signInWithEmailandPassword(
      {required String email, required String password}) async {
    return _auth.signInWithEmailAndPassword(email: email, password: email);
  }

  Future<UserCredential> signUpWithEmailandPassword(
      {required String email, required String password}) async {
    return _auth.createUserWithEmailAndPassword(email: email, password: email);
  }
}
