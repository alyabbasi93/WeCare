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
  // initilize  Variable
  List<SolutionModel> _solutionmodel;
  bool _loading;



  // Screen Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 370,
        child: _loading
            ? Center(child: CircularProgressIndicator())
        // ListView for display items
            : ListView.builder(
                itemCount: null == _solutionmodel ? 0 : _solutionmodel.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  print(_solutionmodel.length);
                  SolutionModel user = _solutionmodel[i];
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
    // Loading Data
    _loading = true;
    super.initState();
    solutionServices.getsolution().then((users) {
      setState(() {
        _solutionmodel = users;
        _loading = false;
      });
    });
  }
}
