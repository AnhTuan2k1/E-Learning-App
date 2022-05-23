//import navigations
import 'package:sciolism_app/screens/main_page.dart';
import 'package:sciolism_app/screens/authentication/signInScreen.dart';
import 'package:sciolism_app/screens/authentication/signUpScreen.dart';
import 'package:sciolism_app/screens/authentication/authenticationWrapper.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen1.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen2.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen3.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// --------

Route createRoute(nameRoute) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (nameRoute) {
        case "authentication":
          return authenticationWrapper();

        case "signIn":
          return signInScreen();

        case "signUp":
          return signInScreen();
        
        case "forgotPassword":
          return signInScreen();

        case "instruction":
          return signInScreen();

        case "terms":
          return signInScreen();

        case "verification":
          return signInScreen();
      }
      return nameRoute;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
