// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_demo_app/List_View_Item.dart';
import 'package:e_commerce_demo_app/app_bar_title.dart';
import 'package:e_commerce_demo_app/lower_half_part.dart';
import 'package:e_commerce_demo_app/page_view_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 244, 239, 239),
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.grey[290],
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.grey[250]),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: AppBarTitle()),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 635,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 244, 239, 239),
                ),
                child: ListView(
                  children: <Widget>[
                    ListViewItem(),
                  ],
                ),
              )

              //////////////////////////////
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: 42,
            child: Padding(
                padding: EdgeInsets.only(left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.home_filled,
                          size: 38,
                        )),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.settings,
                          size: 38,
                        )),
                  ],
                )),
          )),
    );
  }
}
