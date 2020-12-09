import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDetail extends StatefulWidget {
  final name;
  final info;
  final services;
  final adress;
  final number;

  // In the constructor, require a Todo.
  InfoDetail(
      {Key key,
      @required this.name,
      this.info,
      this.number,
      this.adress,
      this.services})
      : super(key: key);

  @override
  _InfoDetailState createState() =>
      _InfoDetailState(name, number, info, services, adress);
}

class _InfoDetailState extends State<InfoDetail> {
  var name;
  var number;
  var info;
  var service;
  var adress;

  _InfoDetailState(
      this.name, this.number, this.info, this.service, this.adress);

  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Detail", textAlign: TextAlign.center),
      ),
      //
      bottomNavigationBar: GestureDetector(
          onTap: () => launch("tel:$number"),
          child: Container(
            height: 50,
            padding: EdgeInsets.only(top: 15),
            color: Colors.red,
            child: Text(
              'Call',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.green),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Card(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Column(
                  children: [
                    ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Information',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      collapsed: Text(
                        info,
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.start,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //for (var _ in Iterable.generate(1))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                info,
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.start,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Services',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        collapsed: Text(
                          service,
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.start,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //for (var _ in Iterable.generate(1))
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  service,
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Address',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        collapsed: Text(
                          adress,
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.start,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //for (var _ in Iterable.generate(1))
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  adress,
                                  style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
