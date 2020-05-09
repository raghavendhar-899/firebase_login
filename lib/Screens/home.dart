import 'package:firebase1/Services/auth.dart';
import 'package:firebase1/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {


final AuthService _auth=AuthService();


  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    return Container(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 20, 20, 1),
        centerTitle: false,
        title: Text("Home page"),
        actions: <Widget>[
          FlatButton.icon(
            // color: Colors.white70,
            textColor: Colors.white70,
            icon: Icon(Icons.person_outline),
            label: Text("logout"),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(50, 200, 50, 300),
          child: Text("Welcome  \n \n${user.uid.substring(20)}!",
              style: TextStyle(color: Colors.white, fontSize: 30.0))),
    ));
  }
}
