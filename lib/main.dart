// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:e_commerce_demo_app/List_View_Item.dart';
import 'package:e_commerce_demo_app/app_bar_title.dart';
import 'package:e_commerce_demo_app/lower_half_part.dart';
import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/page_view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[250],
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Siya.Store",
      home: HomePage(title: "Siya.Store"),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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

  double getHeight(BuildContext context) {
    double hgt = MediaQuery.of(context).size.height;
    debugPrint("hgt:$hgt");
    return hgt;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 244, 239, 239),
          body: Container(
            height: getHeight(context) - 42,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: AppBarTitle(
                      mSuggestions: categoryList,
                      categoryWise: categoryWiseItem,
                    )),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: getHeight(context) * 0.73,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: SingleChildScrollView(
                      child: ListViewItem(
                          itemList: itemList,
                          categoryList: categoryList,
                          categoryWiseItem: categoryWiseItem,
                          actionList: actionList),
                    ))

                //////////////////////////////
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 50,
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image(
                        image: AssetImage("lib/icon/home.png"),
                        height: 32,
                        color: Color.fromARGB(255, 255, 64, 0)),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("lib/icon/settings.png"),
                      height: 32,
                      color: Color.fromARGB(255, 255, 64, 0),
                    ),
                    // IconButton(
                    //     onPressed: null,
                    //     icon: Icon(
                    //       size: 38,
                    //     )),
                    // IconButton(
                    //     onPressed: null,
                    //     icon: Icon(
                    //       Icons.settings,
                    //       size: 38,
                    //     )),
                  ],
                )),
          )),
    );
  }
}
