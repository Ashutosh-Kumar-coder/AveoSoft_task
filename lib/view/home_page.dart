import 'package:aveosoft_task/view/address_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

           Text("Home Page")

          ],
        ),
      ),
    );
  }
}
