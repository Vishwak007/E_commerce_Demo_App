// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce_demo_app/search_bar_app.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Title
        Row(
          children: <Widget>[
            Text(
              "Siya",
              style: TextStyle(
                color: Color.fromARGB(255, 18, 6, 107),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ".",
              style: TextStyle(
                color: Color.fromARGB(255, 145, 2, 2),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Store",
              style: TextStyle(
                color: Color.fromARGB(255, 18, 6, 107),
                fontSize: 28,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // Search Bar and Cart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 300,
              child: SearchBarApp(),
            ),
            Container(
              padding: EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white, blurRadius: 5, spreadRadius: 8)
                  ]),
              child: IconButton(
                padding: EdgeInsets.only(left: 15),
                onPressed: null,
                icon: Icon(Icons.shopping_cart),
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
