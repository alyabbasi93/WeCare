import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/AppContainer.dart';
import 'package:healthcare/appContainerUrdu.dart';

class languageurdu extends StatefulWidget {
  @override
  _languageurduState createState() => _languageurduState();
}

class _languageurduState extends State<languageurdu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width / 0.6,
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
                    MaterialPageRoute(builder: (context) => AppContainer()),
                  );
                },
                child: Text("English"),
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
                    MaterialPageRoute(builder: (context) => AppUrduContainer()),
                  );
                },
                child: Text("اردو"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
