import 'package:firebase1/Services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = '', password = '', e = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white60,
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("Sign in"),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) =>
                  value.contains("@") ? null : "Enter Valid Email",
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) => value.length < 6
                  ? "Enter password more than 6 characters"
                  : null,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
                color: Colors.black,
                child: Text("Register", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        e = "please enter valid details";
                      });
                    } else {}
                  }
                }),
            SizedBox(height: 20),
            Text(
              e,
              style: TextStyle(color: Colors.red),
            ),
          ]),
        ),
      ),
    );
  }
}
