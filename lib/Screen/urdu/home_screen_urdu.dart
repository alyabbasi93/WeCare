import 'package:flutter/material.dart';
import 'package:healthcare/Detail/info_screen_urdu.dart';
import 'package:healthcare/Model/InformationModel.dart';
import 'package:healthcare/Service/Information_Servise.dart';

class HomeScreenUrdu extends StatefulWidget {
  HomeScreenUrdu({Key key}) : super(key: key);

  @override
  _HomeScreenUrduState createState() => _HomeScreenUrduState();
}

class _HomeScreenUrduState extends State<HomeScreenUrdu> {
  // initilize  Variable
  List<InformationModel> _informationModel;
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
                              builder: (context) => infoscreen(
                                    name: user.uName,
                                    services: user.uService,
                                    info: user.uInfo,
                                    adress: user.uAdress,
                                    number: user.number,
                                  )),
                        );
                      },
                      child: Container(
                        height: 100,
                        margin:
                            EdgeInsets.only(left: 50, bottom: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              height: 100,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    user.uName,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )),
                            Container(
                              child: Image.asset(
                                'assets/images/hospital.png',
                                height: 100,
                                width: 100,
                              ),
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
    informationServices.getinformation().then((users) {
      setState(() {
        _informationModel = users;
        _loading = false;
      });
    });
  }
}
