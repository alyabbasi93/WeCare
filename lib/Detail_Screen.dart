import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final todo;
  final todo2;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo, this.todo2}) : super(key: key);
  String data;

  @override
  initState() {
    print(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Detail", textAlign: TextAlign.center),
        ),
        //
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  todo2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Html(data: todo),
              )
            ],
          ),
        ));
  }
}
