import 'package:flutter/material.dart';
import 'package:healthcare/Detail/info_detail.dart';
import 'package:healthcare/Model/InformationModel.dart';
import 'package:healthcare/Service/Information_Servise.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initilize  Variable
  List<InformationModel> _informationModel;
  bool _loading;

  // Screen Design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        child: _loading
            ? Center(child: CircularProgressIndicator())
            // ListView for display items
            : ListView.builder(
                itemCount:
                    null == _informationModel ? 0 : _informationModel.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  print(_informationModel.length);
                  InformationModel user = _informationModel[i];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoDetail(
                                    name: user.name,
                                    services: user.servises,
                                    info: user.information,
                                    adress: user.adress,
                                    number: user.number,
                                  )),
                        );
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                'assets/images/hospital.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: 100,
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    user.name,
                                    textAlign: TextAlign.start,
                                  )),
                            ))
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
    informationServices.getinformation().then((users) {
      setState(() {
        _informationModel = users;
        _loading = false;
      });
    });
  }
}
