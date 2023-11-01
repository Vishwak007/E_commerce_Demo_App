// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:e_commerce_demo_app/grid_view_cart.dart';
import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/object_detail.dart';
import 'package:e_commerce_demo_app/text_cat_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LowerHalfPart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LowerHalfPartState();
  }
}

class LowerHalfPartState extends State<LowerHalfPart> {
  List<Item> itemList = List.empty(growable: true);
  List<String> categoryList = List.empty(growable: true);
  Map<String, List<Item>> categoryWiseItem = {};
  List<Item> actionList = List.empty(growable: true);

  void decodeResponseBody(String respBody) {
    var data = json.decode(respBody);
    List<dynamic> products = data["products"];
    categoryList.add("All");
    for (var it in products) {
      var returnItemObj = Item.fromJson(it);
      if (categoryWiseItem.containsKey(returnItemObj.category)) {
        itemList.add(returnItemObj);
        if (categoryWiseItem[returnItemObj.category] != null) {
          categoryWiseItem[returnItemObj.category]?.add(returnItemObj);
        }
      } else {
        itemList.add(returnItemObj);
        categoryWiseItem[returnItemObj.category] = [returnItemObj];
        categoryList.add(returnItemObj.category);
      }
    }

    categoryWiseItem["All"] = itemList;
    actionList.addAll(itemList);
  }

  Future fetchResponse() async {
    Uri uri = Uri.parse("https://dummyjson.com/products");
    http.Response response;
    response = await http.get(uri);
    debugPrint("responseCodeis ke paas");
    if (response.statusCode == 200) {
      debugPrint("responseCodeis = 201");
      getResponse(response.body);
    } else {
      print("not worked");
    }
  }

  @override
  void initState() {
    fetchResponse();
    super.initState();
  }

  void getResponse(String responseBody) {
    setState(() {
      decodeResponseBody(responseBody);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 13, top: 14),
      // height: 700,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(35), topRight: Radius.circular(35))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, top: 0),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: TextCatCart(
                      categoryName: categoryList[index],
                    ),
                    onTap: () {
                      setState(() {
                        actionList.clear();
                        actionList.addAll(categoryWiseItem[categoryList[index]]
                            as Iterable<Item>);
                      });
                    },
                  );
                }),
          ),
          SizedBox(
            height: 15,
          ),
          // GridView.builder(
          //     itemCount: actionList.length,
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //     itemBuilder: (context, index) =>
          //         GridViewCart(item: actionList[index])),
          Container(
              width: double.infinity,
              height: 450,
              child: GridView.builder(
                itemCount: actionList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  child: GridViewCart(item: actionList[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ObjectDetails(item: actionList[index])),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
