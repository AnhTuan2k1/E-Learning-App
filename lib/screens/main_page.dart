import 'package:flutter/material.dart';

import 'exam/quiz_page.dart';
import 'statistic/statistic_page.dart';
import 'theory/theory_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TheoryPage(),
    QuizPage(),
    Statistic(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Lý Thuyết',),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined), label: 'Luyện Đề',),
          BottomNavigationBarItem(icon: Icon(Icons.insights_outlined), label: 'Thống Kê',),
        ],

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}





