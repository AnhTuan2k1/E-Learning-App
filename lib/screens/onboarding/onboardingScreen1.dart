//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------


class onboardingScreen1 extends StatelessWidget {
  const onboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change status bar color to white
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(backgroundOnboarding), fit: BoxFit.cover),
          // ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                alignment: Alignment.topRight,
                // child: Image.asset(obHandCalendar, scale: 1),
              ),
              SizedBox(height: 47),
              Container(
                padding: EdgeInsets.only(right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Manage Your Schedule',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        )),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'We’re more than a application.' +
                              '\n' +
                              'Customize Grow to work the way you do.',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              height: 1.6),
                          textAlign: TextAlign.right,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
