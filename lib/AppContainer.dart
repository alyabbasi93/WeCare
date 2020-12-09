import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/Screen/language.dart';

import 'Screen/Videos_page.dart';
import 'Screen/exercise_page.dart';
import 'Screen/home_page.dart';
import 'Screen/hospital_page.dart';
import 'Screen/problems_page.dart';
import 'Screen/solution_page.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<String> menuItems = [
    "Home",
    "Problems",
    "Solution",
    "Exercise",
    "Videos",
    "Hospital",
    "language"
  ];
  final List<String> menuIcons = [
    "house",
    "problem",
    "jigsaw",
    "exercise",
    "video",
    "hospital_icon",
    "languages",
  ];

  bool sidebarOpen = false;

  double yOffset = 0;
  double xOffset = 60;
  double pageScale = 1;

  int selectedMenuItem = 0;

  String pageTitle = "Home";
  int _selectedIndex = 0;
  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 60;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageTitle() {
    switch (selectedMenuItem) {
      case 0:
        pageTitle = "Home";
        _onItemTapped(0);
        break;
      case 1:
        pageTitle = "Problems";
        _onItemTapped(1);
        break;
      case 2:
        pageTitle = "Solution";
        _onItemTapped(2);
        break;
      case 3:
        pageTitle = "Exercise";
        _onItemTapped(3);
        break;
      case 4:
        pageTitle = "Videos";
        _onItemTapped(4);
        break;
      case 5:
        pageTitle = "Hospital";
        _onItemTapped(5);
        break;
      case 6:
        pageTitle = "Language";
        _onItemTapped(6);
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _widgetOptions = [
    HomePage(),
    Problems(),
    solution(),
    ExerciseBlog(),
    videos(),
    hospitalpage(),
    language()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            body: Container(
                alignment: Alignment.topRight,
                color: Colors.lightGreen,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 24),
                              child: Container(
                                color: Colors.lightGreen,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Expanded(
                                  child: new ListView.builder(
                                      itemCount: menuItems.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              sidebarOpen = false;
                                              selectedMenuItem = index;
                                              setSidebarState();
                                              setPageTitle();
                                            },
                                            child: MenuItem(
                                              itemIcon: menuIcons[index],
                                              itemText: menuItems[index],
                                              selected: selectedMenuItem,
                                              position: index,
                                            ),
                                          ))),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 200),
                        transform:
                            Matrix4.translationValues(xOffset, yOffset, 1.0)
                              ..scale(pageScale),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: sidebarOpen
                                ? BorderRadius.circular(20)
                                : BorderRadius.circular(0)),
                        child: Column(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(top: 24),
                                height: 60,
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        sidebarOpen = !sidebarOpen;
                                        setSidebarState();
                                      },
                                      child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(20),
                                          child: Icon(Icons.menu)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Text(
                                        pageTitle,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                child: _widgetOptions.elementAt(_selectedIndex))
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

class MenuItem extends StatelessWidget {
  final String itemText;
  final String itemIcon;
  final int selected;
  final int position;
  MenuItem({this.itemText, this.itemIcon, this.selected, this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? Colors.lightGreen : Colors.lightGreen,
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/$itemIcon.png")),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
