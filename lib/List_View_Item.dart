// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_demo_app/lower_half_part.dart';
import 'package:e_commerce_demo_app/page_view_cart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListViewItem extends StatelessWidget {
  final _controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Trendings",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //////////////////////////////////////
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(left: 15, right: 20),
          child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              PageViewCart(
                firstName: "Cell Phones",
                lastName: "Accessories",
                numStories: 200,
                path: "lib/icon/smartphone1.png",
                colour: Color.fromARGB(255, 0, 150, 51),
              ),
              PageViewCart(
                firstName: "Shoes",
                lastName: "Clothes",
                numStories: 120,
                path: "lib/icon/shoe.png",
                colour: Color.fromARGB(255, 33, 244, 255),
              ),
              PageViewCart(
                firstName: "Perfumes",
                lastName: "Jwelleries",
                numStories: 390,
                path: "lib/icon/perfume1.png",
                colour: Color.fromARGB(255, 255, 53, 38),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
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
        SizedBox(
          height: 20,
        ),
        LowerHalfPart(),
      ],
    );
  }
}
