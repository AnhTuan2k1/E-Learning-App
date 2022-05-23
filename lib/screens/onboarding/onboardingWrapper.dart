import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sciolism_app/constaint/colors.dart';

//import navigations
import 'package:sciolism_app/screens/main_page.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen1.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen2.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen3.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------

class onboardingWrapper extends StatefulWidget {
  @override
  _onboardingWrapperState createState() => _onboardingWrapperState();
}

class _onboardingWrapperState extends State<onboardingWrapper> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    onboardingScreen1(),
    onboardingScreen2(),
    onboardingScreen3()
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List<Widget>.generate(_pages.length, (int index) {
                          return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 8,
                              width: (index == _currentPage) ? 24 : 8,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: (index == _currentPage)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: black,
                                    )
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: grey,
                                    ));
                        })),
                    Spacer(),
                    (_currentPage == (_pages.length - 1))
                        ? Container(
                            margin: EdgeInsets.only(),
                            child: GestureDetector(
                              //action navigate to next onboarding screen
                              onTap: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.easeInOutQuint);
                              },
                              child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 54,
                                  width: 220,
                                  decoration: BoxDecoration(
                                    color: black,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Thử ngay miễn phí",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )),
                            ))
                        : Container(
                            child: GestureDetector(
                            //action navigate to next onboarding screen
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOutQuint);
                            },
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 54,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Tiếp theo",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )),
                          )),
                  ],
                ),
                //button navigation

                //button close
                Container(
                  alignment: Alignment.topCenter,
                  child: (_currentPage != _pages.length - 1)
                      ? GestureDetector(
                          onTap: () {
                            _controller.animateToPage(_pages.length - 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Container(
                              // child: SvgPicture.asset(outlineClose,
                              //     height: 40, width: 40),
                              ),
                        )
                      : Container(
                          child: Text(""),
                        ),
                ),
                SizedBox(height: 24),
              ],
            ),
          )
        ],
      ),
    );
  }
}
