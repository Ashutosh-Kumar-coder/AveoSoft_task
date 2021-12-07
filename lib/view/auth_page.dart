import 'package:aveosoft_task/view/home_page.dart';
import 'package:aveosoft_task/view/login_via_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var email = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoTextField(
              placeholder: "email",
              controller: email,
              keyboardType: TextInputType.emailAddress,
            ),
            CupertinoTextField(
              placeholder: "Password",
              controller: password,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            CupertinoButton(
                color: Colors.grey,
                child: const Text("Login using Email"),
                onPressed: () async {
                  await authEmailFirebase(email.text, password.text);
                }),
            CupertinoButton(
                color: Colors.grey,
                child: const Text("Login using Phone"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginViaPhone(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<void> authEmailFirebase(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //Already have use

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => HomePage()));
      }
    } catch (e) {
      print(e);
    }
  }
}
