//import navigations
import 'package:sciolism_app/screens/authentication/signInScreen.dart';
import 'package:sciolism_app/screens/authentication/signUpScreen.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// --------


class authenticationWrapper extends StatelessWidget {
  const authenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Authentication Wrapper', style: TextStyle(fontSize: 72)));
  }
}