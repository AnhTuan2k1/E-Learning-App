import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //dot
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 8,
                        width: (index == _currentPage) ? 30 : 8,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: (index == _currentPage)
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFFFFFFF),
                                boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFFFFFFF).withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Color(0xFFFFFFFF).withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ])
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFe8e8e8),
                              ));
                  })),
              SizedBox(height: 32),

              //button navigation
              Container(
                  alignment: Alignment.center,
                  child: (_currentPage == (_pages.length - 1))
                      ? GestureDetector(
                          //action navigate to signin screen
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 54,
                            width: 260,
                            decoration: BoxDecoration(
                              color: Color(0xFF8d71d8),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFFFFFFF).withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 64,
                                  offset: Offset(
                                      15, 15), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: Color(0xFFFFFFFF).withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: Offset(
                                      8, 8), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        )
                      : GestureDetector(
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
                              width: 260,
                              decoration: BoxDecoration(
                                color: Color(0xFF8e71d8),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFFFFFF).withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 64,
                                    offset: Offset(
                                        15, 15), // changes position of shadow
                                  ),
                                  BoxShadow(
                                    color: Color(0xFFFFFFFF).withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: Offset(
                                        8, 8), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: (_currentPage == 0)
                                  ? Text(
                                      "Get started",
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )
                                  : Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    )),
                        )),
              SizedBox(height: 32),

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
              SizedBox(height: (_currentPage == _pages.length - 1) ? 38 : 53),
            ],
          )
        ],
      ),
    );
  }
}
