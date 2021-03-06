//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sciolism_app/constaint/colors.dart';
import 'package:sciolism_app/constaint/images.dart';
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
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  print('tap');
                },
                child: Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    child: Icon(
                      Iconsax.forward,
                      size: 24,
                      color: black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 136 + 32),
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 200,
                width: 300,
                alignment: Alignment.topCenter,
                child: Image.asset(imageOnboarding1, scale: 1),
              ),
              SizedBox(height: 78 + 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    'H???c t???t c??? m???i th???.' + '\n' + 'M???t kh??ng gian duy nh???t.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  )),
                  SizedBox(height: 8),
                  Container(
                      width: 312,
                      child: Text(
                        'N??ng cao kh??? n??ng h???c th???c c???a b???n, gi??p ho??n thi???n b???n th??n h??n. Sciolism l?? m???t c??ch m???i ????? h???c m???i th??? theo c??ch c???a b???n!',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: black,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
