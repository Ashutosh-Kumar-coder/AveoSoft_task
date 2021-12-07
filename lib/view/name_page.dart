import 'package:aveosoft_task/view/address_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();

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
              placeholder: "First Name",
              controller: firstName,
              keyboardType: TextInputType.name,
            ),
            CupertinoTextField(
              placeholder: "Last Name",
              controller: lastName,
              keyboardType: TextInputType.name,
            ),
            CupertinoButton(
              color: Colors.grey,
                child: Text("Next"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddressPage(),
                  ));
                })
          ],
        ),
      ),
    );
  }
}
