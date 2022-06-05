import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SingInWithGoogle extends StatelessWidget {
  const SingInWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(color: Colors.blueAccent),
                ),
              )),
          onPressed: () {
            signInWithGoogleFirebase(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset("assets/images/google.png"),
                const Text(
                  "Google İle Giriş Yap",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signInWithGoogleFirebase(BuildContext context) {
    signInWithGoogle(context);
  }

  signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential

    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    var user = userCredential.user;
    _open(user, context);
  }

  _open(var user, BuildContext context) {
    if (user != null) {
      const CircularProgressIndicator(
        color: Colors.blueAccent,
      );
      Navigator.pushNamed(context, "/HomeScreen");
    } else {}
  }
}
/*
if(user!=null){
Navigator.pushNamed(context,"/HomeScreen");
}else{
const CircularProgressIndicator(
color: Colors.blueAccent,
);
}

 */