// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:flutter/material.dart';

class TextCatCart extends StatefulWidget {
  String categoryName;
  TextCatCart({
    required this.categoryName,
  });
  @override
  State<StatefulWidget> createState() {
    return TextCatCartState(categoryName: categoryName);
  }
}

class TextCatCartState extends State<TextCatCart> {
  String categoryName;
  Color textColor = Color.fromARGB(255, 229, 66, 48);
  Color backgroundColor = Color.fromARGB(255, 244, 244, 245);
  TextCatCartState({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.only(top: 7, bottom: 7, right: 14, left: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color.fromARGB(255, 229, 66, 48)),
        color: Colors.grey[50],
      ),
      child: Text(
        categoryName,
        style: TextStyle(
            color: textColor, fontSize: 16, backgroundColor: backgroundColor),
      ),
      // child: ElevatedButton(
      //   style: ButtonStyle(
      //     backgroundColor:
      //         MaterialStatePropertyAll(Color.fromARGB(255, 241, 240, 240)),
      //     overlayColor: MaterialStateProperty.resolveWith<Color?>(
      //       (Set<MaterialState> states) {
      //         if (states.contains(MaterialState.pressed))
      //           return Color.fromARGB(255, 150, 241, 93); //<-- SEE HERE
      //         return Colors.white; // Defer to the widget's default.
      //       },
      //     ),
      //   ),
      //   onPressed: () {},
      //   child: Text(
      //     categoryName,
      //     style:
      //         TextStyle(color: Color.fromARGB(255, 229, 66, 48), fontSize: 16),
      //   ),
      // ),
    );
  }
}
