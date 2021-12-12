import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tweet/services/firebase/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final void Function() toggle;

  const LoginScreen({Key? key, required this.toggle}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuthService();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                        'Login',
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: SizedBox(
                          height: 40.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/bg.jpg'),
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            )),
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                EvaIcons.google,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(EvaIcons.facebook)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                EvaIcons.github,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Don't Have an Account?"),
                          TextButton(
                            onPressed: widget.toggle,
                            child: const Text("Sign Up"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
