import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Video_player.dart';

class videosurdu extends StatefulWidget {
  @override
  _videosurduState createState() => _videosurduState();
}

class _videosurduState extends State<videosurdu> {
  @override
  Widget build(BuildContext context) {
    List itemList = [
      'https://wecare2021.000webhostapp.com/bot/5%20Myths%20about%20Mental%20Illnesses.mp4',
      'https://wecare2021.000webhostapp.com/bot/Talking%20Mental%20Health.mp4',
      'https://wecare2021.000webhostapp.com/bot/7%20Ways%20to%20Detox%20Your%20Emotional%20Well%20Being.mp4',
      'https://wecare2021.000webhostapp.com/bot/10%20Easy%20Self%20Care%20Tips%20for%20Depression.mp4',
      'https://wecare2021.000webhostapp.com/bot/Exercise%20therapy%20for%20mental%20illness.mp4'
    ];

    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width / 0.6,
            child: SingleChildScrollView(
              physics: new BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListView.separated(
                    shrinkWrap: true,
                    cacheExtent: 1000,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: true,
                    itemCount: itemList.isEmpty ? 0 : itemList.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(
                        left: 50,
                        bottom: 10,
                      ),
                      height: 300,
                      width: 100,
                      alignment: Alignment.center,
                      child: Container(
                          key: new PageStorageKey(
                            "keydata$index",
                          ),
                          child: VideoWidget(
                            play: true,
                            url: itemList.elementAt(index),
                          )),
                    ),
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                ],
              ),
            )));
  }
}
