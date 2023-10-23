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
                    child: AppBarTitle()),
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
                      child: ListViewItem(),
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
                        color: Color.fromARGB(255, 229, 66, 48)),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("lib/icon/settings.png"),
                      height: 32,
                      color: Color.fromARGB(255, 229, 66, 48),
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
