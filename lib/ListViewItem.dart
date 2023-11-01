import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  Color colour;
  String type;
  String value;
  ListItem(
      {super.key,
      required this.colour,
      required this.type,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colour,
      padding: EdgeInsets.only(top: 3, bottom: 3),
      // alignment: Alignment.topLeft,
      // height: (MediaQuery.of(context).size.height * 0.3) - 50,
      width: MediaQuery.of(context).size.width * 0.6 - 13,
      // child: RichText(
      //   text: TextSpan(
      //     text: "$type         ",
      //     style: TextStyle(
      //         color: Color.fromARGB(255, 151, 150, 150), fontSize: 16),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.pink,
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.4 - 22,
            child: Text(
              type,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 133, 132, 132),
                fontSize: 16,
              ),
            ),
          ),
          Container(
            // color: Colors.amber,
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.6 - 15,
            child: RichText(
              textAlign: TextAlign.left,
              maxLines: 5,
              text: TextSpan(
                text: "$value",
                style: TextStyle(
                  color: Color.fromARGB(255, 28, 27, 27),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
