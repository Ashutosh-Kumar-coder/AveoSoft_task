import 'package:aveosoft_task/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginViaPhone extends StatefulWidget {
  const LoginViaPhone({Key? key}) : super(key: key);

  @override
  _LoginViaPhoneState createState() => _LoginViaPhoneState();
}

class _LoginViaPhoneState extends State<LoginViaPhone> {
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1, vertical: size.height * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoTextField(
              placeholder: "Your Mobile umber",
              controller: phone,
              keyboardType: TextInputType.phone,
            ),
            CupertinoButton(
                color: Colors.grey,
                child: Text("Login Vai Phone"),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.verifyPhoneNumber(
                    phoneNumber: phone.text,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                    codeSent: (String verificationId, int? resendToken) async {
                      String smsCode = '1234';

                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: smsCode);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                })
          ],
        ),
      ),
    );
  }


}
