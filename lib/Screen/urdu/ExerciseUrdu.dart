import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Model/ExerciseModel.dart';
import 'package:healthcare/Service/Urduexercise_servise.dart';

import '../../Detail/Detail_Screen.dart';

class ExerciseUrduBlog extends StatefulWidget {
  ExerciseUrduBlog({Key key}) : super(key: key);

  @override
  _ExerciseUrduBlogState createState() => _ExerciseUrduBlogState();
}

class _ExerciseUrduBlogState extends State<ExerciseUrduBlog> {
  // initilize  Variable
  List<ExerciseModels> _exercisemodel;
  bool _loading;

  // Screen Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width / 0.6,
        child: _loading
            ? Center(child: CircularProgressIndicator())
            // ListView for display items
            : ListView.builder(
                itemCount: null == _exercisemodel ? 0 : _exercisemodel.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  print(_exercisemodel.length);
                  ExerciseModels user = _exercisemodel[i];
                  return GestureDetector(
                      onTap: () {
                        // Move to detail Page
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
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
                              textAlign: TextAlign.end,
                              style: GoogleFonts.asul(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
    urduExerciseServices.geturduexercise().then((users) {
      setState(() {
        _exercisemodel = users;
        _loading = false;
      });
    });
  }
}
