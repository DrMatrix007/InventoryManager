import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn();

@immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  Future login() async {
    setState(() {
      isLoading = true;
    });
    final account = await _googleSignIn.signIn();

    final auth = await account?.authentication;
    if (auth != null) {
      final cred = GoogleAuthProvider.credential(accessToken: auth.accessToken, idToken: auth.idToken);

      await FirebaseAuth.instance.signInWithCredential(cred);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: const Icon(Icons.login),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () => login(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/google.png",
                width: 40,
              ),
            ),
            const Text(
              "Log in with google",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      )),
    );
  }
}
