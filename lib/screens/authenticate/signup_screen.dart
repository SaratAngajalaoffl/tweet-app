import 'package:flutter/material.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() toggle;

  const SignUpScreen({Key? key, required this.toggle}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bg.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      'Or Login Using',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook_rounded)),
                      IconButton(
                          onPressed: () {
                            FirebaseAuthService().signInWithGoogle();
                          },
                          icon: const Icon(Icons.g_mobiledata_rounded)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook_rounded)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have an Account?"),
                      TextButton(
                        onPressed: widget.toggle,
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
