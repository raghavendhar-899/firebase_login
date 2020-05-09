import 'package:firebase1/Services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // TextField state
  String email = '', password = '', e = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign In"),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white60,
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed: () {
              widget.toggleView();
            },
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
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.black26,
                ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) => value.isEmpty ? "Enter password" : null,
              obscureText: true,
              decoration: InputDecoration(hintText: "Passw ord"),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
                color: Colors.black,
                child: Text("Sign in", style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result==null)
                    {
                      e='could not signin';
                    }
                    else{
                      
                    }
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
