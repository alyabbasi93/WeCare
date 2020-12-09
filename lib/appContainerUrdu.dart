import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/Screen/urdu/ExerciseUrdu.dart';
import 'package:healthcare/Screen/urdu/SolutionUrdu.dart';
import 'package:healthcare/Screen/urdu/VideosUrdu_page.dart';
import 'package:healthcare/Screen/urdu/home_screen_urdu.dart';
import 'package:healthcare/Screen/urdu/hospitalurdu.dart';
import 'package:healthcare/Screen/urdu/languageurdu.dart';
import 'package:healthcare/Screen/urdu/problemsUrdu.dart';

class AppUrduContainer extends StatefulWidget {
  @override
  _AppUrduContainerState createState() => _AppUrduContainerState();
}

class _AppUrduContainerState extends State<AppUrduContainer> {
  final List<String> menuItems = [
    "گھر",
    "مسائل",
    "حل",
    "ورزش",
    "ویڈیوز",
    "ہسپتال",
    "زبان"
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
  double xOffset = -60;
  double pageScale = 1;

  int selectedMenuItem = 0;

  String pageTitle = "گھر";
  int _selectedIndex = 0;
  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? -80 : -60;
      yOffset = sidebarOpen ? 70 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageTitle() {
    switch (selectedMenuItem) {
      case 0:
        pageTitle = "گھر";
        _onItemTapped(0);
        break;
      case 1:
        pageTitle = "مسائل";
        _onItemTapped(1);
        break;
      case 2:
        pageTitle = "حل";
        _onItemTapped(2);
        break;
      case 3:
        pageTitle = "ورزش";
        _onItemTapped(3);
        break;
      case 4:
        pageTitle = "ویڈیوز";
        _onItemTapped(4);
        break;
      case 5:
        pageTitle = "ہسپتال";
        _onItemTapped(5);
        break;
      case 6:
        pageTitle = "زبان";
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
    HomeScreenUrdu(),
    Problemsurdu(),
    solutionurdu(),
    ExerciseUrduBlog(),
    videosurdu(),
    hospitalUrdupage(),
    languageurdu()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Nunito"),
        home: Scaffold(
            body: Container(
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 10),
                                      width: 50,
                                      child: Text(
                                        pageTitle,
                                        style: TextStyle(
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/$itemIcon.png")),
        ],
      ),
    );
  }
}
