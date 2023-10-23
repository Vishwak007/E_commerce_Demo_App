// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:flutter/material.dart';

class GridViewCart extends StatelessWidget {
  Item item;
  GridViewCart({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3, bottom: 3),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 200,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(image: NetworkImage(item.thumbnail))),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  item.title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Text(
            "Rs ${item.price}.00",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
