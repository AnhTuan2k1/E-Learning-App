//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sciolism_app/constaint/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------

class onboardingScreen2 extends StatefulWidget {
  const onboardingScreen2({Key? key}) : super(key: key);
  @override
  State<onboardingScreen2> createState() => _onboardingScreen2();
}

class _onboardingScreen2 extends State<onboardingScreen2> {
  TabController? _tabController;
  int _selectedIndex = 0;
  double _currentPosition = 0.0;
  late PageController pageController;
  double viewportFraction = 0.554;
  double? pageOffset = 0;
  double? scale;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
    // _tabController!.addListener(() {
    //   setState(() {
    //     _tabController != _tabController;
    //   });
    //   _selectedIndex = _tabController!.index;
    //   print(_selectedIndex);
    // });
  }

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
          padding: EdgeInsets.all(24),
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
              // Container(
              //               padding: EdgeInsets.only(top: 32),
              //               width: double.maxFinite,
              //               height: 512,
              //               child:
              //               TabBarView(
              //                   controller: _tabController,
              //                   children: [
              //                     _selectedIndex == 0 ? viewDrinksPerTabHorizontal() : Container(),
              //                     _selectedIndex == 1 ? viewDrinksPerTabHorizontal() : Container(),
              //                     _selectedIndex == 2 ? viewDrinksPerTabHorizontal() : Container(),
              //                     _selectedIndex == 3 ? viewDrinksPerTabHorizontal() : Container(),
              //       ])
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
