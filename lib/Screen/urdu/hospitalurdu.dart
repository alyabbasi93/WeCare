import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Model/hospitalModel.dart';
import 'package:healthcare/Service/Hospital_service.dart';

import '../map_page.dart';

class hospitalUrdupage extends StatefulWidget {
  @override
  _hospitalUrdupageState createState() => _hospitalUrdupageState();
}

class _hospitalUrdupageState extends State<hospitalUrdupage> {
  // initilize  Variable
  HospitalModel _hospitalmodel;
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
              : _loading
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: List.generate(
                          null == _hospitalmodel
                              ? 0
                              : _hospitalmodel.results.length, (index) {
                        final x = _hospitalmodel.results[index];
                        return new GestureDetector(
                            onTap: () {
                              print("Container clicked");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mappage(
                                    longitude: x.geometry.location.lng,
                                    latitude: x.geometry.location.lat,
                                    name: x.name,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                height: 300,
                                width: 300,
                                margin: EdgeInsets.fromLTRB(0, 10, 50, 10),
                                child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    verticalDirection: VerticalDirection.down,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 1, right: 1),
                                          child: Column(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.asset(
                                                  'assets/images/hospital.png',
                                                  height: 250,
                                                  width: 250,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              new Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20.0),
                                                child: new Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Flexible(
                                                        child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0, top: 10),
                                                      child: new Text(x.name,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.asul(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ))
                                    ])));
                      }),
                    )),
    );
  }

  @override
  void initState() {
    // Loading Data
    _loading = true;
    super.initState();
    HospitalServices.gethospitals().then((users) {
      setState(() {
        _hospitalmodel = users;
        _loading = false;
      });
    });
  }
}
