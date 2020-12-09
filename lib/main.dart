import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/AppContainer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home: Scaffold(
        body: Container(
          alignment: Alignment.topRight,
          color: Colors.lightGreen,
          child: AppContainer(),
        ),
      ),
    );
  }
}
