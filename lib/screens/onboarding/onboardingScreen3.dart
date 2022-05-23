//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------

class onboardingScreen3 extends StatelessWidget {
  const onboardingScreen3({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(38),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(backgroundOnboarding), fit: BoxFit.cover),
          // ),
          child: Column(
            children: [
              SizedBox(height: 48),
              Container(
                alignment: Alignment.center,
                // child: Image.asset(obDocumentFile, scale: 1),
              ),
              SizedBox(height: 32),
              Container(
                // padding: EdgeInsets.only(right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Team up without' + '\n' + 'the chaos',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Team up without the chaos.' +
                              '\n' +
                              'Connect your teams, projects, and' +
                              '\n' +
                              'docs in Grow - so you can bust silos' +
                              '\n' +
                              'and move as one.',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              height: 1.6),
                          textAlign: TextAlign.center,
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
