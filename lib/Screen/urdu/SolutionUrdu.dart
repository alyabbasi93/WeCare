import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Model/SolutionModel.dart';
import 'package:healthcare/Service/solutionurduServices.dart';

import '../../Detail/Detail_Screen.dart';

class solutionurdu extends StatefulWidget {
  @override
  _solutionurduState createState() => _solutionurduState();
}

class _solutionurduState extends State<solutionurdu> {
  // initilize  Variable
  List<SolutionModel> _solutionmodel;
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
    solutionurduServices.geturdusolution().then((users) {
      setState(() {
        _solutionmodel = users;
        _loading = false;
      });
    });
  }
}
