import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Model/ProblemsModels.dart';
import 'package:healthcare/Service/urduproblem_Service.dart';

import '../../Detail/Detail_Screen.dart';

class Problemsurdu extends StatefulWidget {
  @override
  _ProblemsurduState createState() => _ProblemsurduState();
}

class _ProblemsurduState extends State<Problemsurdu> {
  // initilize  Variable
  List<ProblemsModels> _problemmodel;
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
                itemCount: null == _problemmodel ? 0 : _problemmodel.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  print(_problemmodel.length);
                  ProblemsModels user = _problemmodel[i];
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
                                margin: EdgeInsets.only(right: 0),
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
    ProblemsurduServices.getproblemsurdu().then((users) {
      setState(() {
        _problemmodel = users;
        _loading = false;
      });
    });
  }
}
