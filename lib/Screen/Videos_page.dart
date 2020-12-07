import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Video_player.dart';

class videos extends StatefulWidget {
  @override
  _videosState createState() => _videosState();
}

class _videosState extends State<videos> {
  @override
  Widget build(BuildContext context) {
    List itemList = [
      'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
      'https://wecare2021.000webhostapp.com/bot/Talking%20Mental%20Health.mp4'
    ];

    return Scaffold(
        body: Container(
            width: 370,
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
                      width: double.infinity,
                      height: 300,
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
