import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/AppContainer.dart';
import 'package:healthcare/appContainerUrdu.dart';

class language extends StatefulWidget {
  @override
  _languageState createState() => _languageState();
}

class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            alignment: Alignment.bottomCenter,
            height: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppUrduContainer()),
                      );
                    },
                    child: Text("اردو"),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppContainer()),
                      );
                    },
                    child: Text("English"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
