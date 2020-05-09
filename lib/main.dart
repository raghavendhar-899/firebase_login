import 'package:firebase1/model/user.dart';
import 'package:firebase1/wrapper.dart';
import 'Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Firebase",
        home: Wrapper(),
      ),
    );
  }
}
