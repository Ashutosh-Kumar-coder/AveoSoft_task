import 'package:aveosoft_task/view/auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  var street = TextEditingController();
  var city = TextEditingController();
  var zip = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              placeholder: "Street",
              controller: street,
              keyboardType: TextInputType.streetAddress,
            ),
            CupertinoTextField(
              placeholder: "City",
              controller: city,
              keyboardType: TextInputType.streetAddress,
            ),
            CupertinoTextField(

              placeholder: "Zip Code",
              controller: zip,
              keyboardType: TextInputType.number,
            ),
            CupertinoButton(
                color: Colors.grey,
                child: Text("Next"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AuthPage(),
                  ));
                })
          ],
        ),
      ),
    );
  }
}
