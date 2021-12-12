import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<void> signInWithGoogle() async {}

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    // final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential =
    //     FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithGitHub() async {
    // final GitHubSignIn gitHubSignIn = GitHubSignIn(
    //     clientId: clientId,
    //     clientSecret: clientSecret,
    //     redirectUrl: redirectUrl);
    // var result = await gitHubSignIn.signIn(context);
    // switch (result.status) {
    //   case GitHubSignInResultStatus.ok:
    //     print(result.token)
    //     break;

    //   case GitHubSignInResultStatus.cancelled:
    //   case GitHubSignInResultStatus.failed:
    //     print(result.errorMessage);
    //     break;
    // }
  }

  Future<void> signInWithEmailandPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: email);
  }

  Future<void> signUpWithEmailandPassword(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
