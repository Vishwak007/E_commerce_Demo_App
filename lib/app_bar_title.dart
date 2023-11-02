// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/my_cart_page.dart';
import 'package:e_commerce_demo_app/search_bar_app.dart';
import 'package:e_commerce_demo_app/show_item_list.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final List<String> mSuggestions;
  final Map<String, List<Item>> categoryWise;

  AppBarTitle(
      {super.key, required this.mSuggestions, required this.categoryWise});
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
            //for search bar SearchBarApp()
            Container(
              width: 300,
              height: 50,
              // ignore: sort_child_properties_last
              child: EasySearchBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Search...",
                  style: TextStyle(fontSize: 16),
                ),
                suggestions: mSuggestions,
                suggestionTextStyle: TextStyle(fontSize: 16),
                onSearch: (value) => debugPrint(value),
                onSuggestionTap: (data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowItemList(
                            actionListM: categoryWise[data],
                            mSuggestions: mSuggestions,
                            categoryWise: categoryWise)),
                  );
                },
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
            //For cart icon
            GestureDetector(
              child: Container(
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyCartPage(
                          listOfAddedItem: categoryWise[mSuggestions[0]],
                          listOfQuant: null)),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
