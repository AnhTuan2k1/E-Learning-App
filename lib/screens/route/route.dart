//import navigations
import 'package:sciolism_app/screens/main_page.dart';
import 'package:sciolism_app/screens/authentication/authenticationWrapper.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen1.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen2.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen3.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// --------

Route createRoute(name) {
  switch (name) {
    case "authentication":
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return authenticationWrapper();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
      break;
  }
  return name;
}
