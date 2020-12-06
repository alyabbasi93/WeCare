import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Model/SolutionModel.dart';
import 'package:healthcare/Service/Solutionservice.dart';

import '../Detail_Screen.dart';

class solution extends StatefulWidget {
  @override
  _solutionState createState() => _solutionState();
}

class _solutionState extends State<solution> {
  List<SolutionModel> _users;
  bool _loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 370,
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: null == _users ? 0 : _users.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  print(_users.length);
                  SolutionModel user = _users[i];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                todo: user.content.rendered,
                                todo2: user.title.rendered),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: 370,
                                height: 200,
                                child: Image.network(
                                  'https://wecare2021.000webhostapp.com/wp-content/uploads/${user.betterFeaturedImage.mediaDetails.file}',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              user.title.rendered,
                              style: GoogleFonts.asul(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ));
                },
              ),
      ),
    );
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    solutionServices.getsolution().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }
}
