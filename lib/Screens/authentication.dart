import 'package:firebase1/Screens/register.dart';
import 'package:firebase1/Screens/signin.dart';
import 'package:flutter/material.dart';


class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSighIn=true;
  void toggleView(){
    setState(() => showSighIn=!showSighIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSighIn){
    return SignIn(toggleView: toggleView);
    }
    else{
    return Register(toggleView: toggleView);
    }
  }
}