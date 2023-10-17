// ignore_for_file: prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ObjectDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ObjectDetailsState();
  }
}

class ObjectDetailsState extends State<ObjectDetails> {
  var _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 500,
            child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      image: DecorationImage(
                          image: AssetImage("lib/icon/ss.jpg"))),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
