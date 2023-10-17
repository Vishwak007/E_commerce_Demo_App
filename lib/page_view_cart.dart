// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class PageViewCart extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int numStories;
  final String path;
  final Color colour;
  PageViewCart(
      {super.key,
      required this.firstName,
      this.lastName = "",
      required this.numStories,
      required this.path,
      required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.only(left: 20, right: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: colour),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  "$firstName &",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$lastName",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "$numStories +",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: colour),
            )
          ],
        ));
  }
}
