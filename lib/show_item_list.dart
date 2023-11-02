// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_demo_app/grid_view_cart.dart';
import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/object_detail.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class ShowItemList extends StatefulWidget {
  final List<Item>? actionListM;
  final List<String> mSuggestions;
  final Map<String, List<Item>> categoryWise;

  const ShowItemList(
      {super.key,
      required this.actionListM,
      required this.mSuggestions,
      required this.categoryWise});

  @override
  State<StatefulWidget> createState() {
    return ShowItemListState(
        actionListM: actionListM,
        mSuggestions: mSuggestions,
        categoryWise: categoryWise);
  }
}

class ShowItemListState extends State<ShowItemList> {
  List<Item>? actionListM;
  final List<String> mSuggestions;
  final Map<String, List<Item>> categoryWise;

  ShowItemListState(
      {required this.actionListM,
      required this.mSuggestions,
      required this.categoryWise});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 244, 239, 239),
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //       blurRadius: 0.8,
        //       spreadRadius: 10,
        //       color: const Color.fromARGB(255, 137, 136, 136))
        // ], color: Colors.white),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 0),
              color: Color.fromARGB(255, 244, 239, 239),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 330,
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
                          setState(() {
                            actionListM = categoryWise[data];
                          });
                        },
                      )),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                spreadRadius: 6)
                          ]),
                      child: IconButton(
                        padding: EdgeInsets.only(left: 15),
                        onPressed: null,
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.amber,
              color: Color.fromARGB(255, 247, 246, 246),
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 6),
              height: MediaQuery.of(context).size.height - 110,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: actionListM!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  child: GridViewCart(item: actionListM![index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ObjectDetails(item: actionListM![index])),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
