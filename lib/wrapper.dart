// import 'dart:async';

import 'package:firebase1/Screens/authentication.dart';
import 'package:firebase1/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 1), () {
    // });
    final user = Provider.of<User>(context);

    if(user!=null)
    {
    return Home();
    }
    else
    {
      return Authentication();
    }
  }
}
