import 'package:e_commerce_demo_app/ListViewItem.dart';
import 'package:e_commerce_demo_app/List_View_Item.dart';
import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:flutter/material.dart';

class Specification extends StatelessWidget {
  var keyList;
  Item item;
  Specification({super.key, required this.item, required this.keyList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      height: (MediaQuery.of(context).size.height * 0.3) + 45,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0, bottom: 15),
        scrollDirection: Axis.vertical,
        itemCount: keyList.length,
        itemBuilder: (context, index) {
          var key = keyList[index];
          return ListItem(
              colour: index % 2 == 0 ? Colors.white : Colors.grey,
              type: key,
              value: item.getItemSpec(key));
        },
      ),
    );
  }
}
