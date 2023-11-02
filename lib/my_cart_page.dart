import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/my_cart_item.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {
  List<Item>? listOfAddedItem;
  List<int>? listOfQuant;
  MyCartPage(
      {super.key, required this.listOfAddedItem, required this.listOfQuant});

  @override
  State<StatefulWidget> createState() {
    return MyCartPageState(
        listOfAddedItem: listOfAddedItem, listOfQuant: listOfQuant);
  }
}

class MyCartPageState extends State<MyCartPage> {
  List<Item>? listOfAddedItem;
  List<int>? listOfQuant;
  MyCartPageState({required this.listOfAddedItem, required this.listOfQuant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 241, 241, 241),
        padding: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listOfAddedItem!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child:
                    MyCartItem(product: listOfAddedItem![index], quantity: 5),
                onTap: () {
                  null;
                },
              );
            }),
      ),
    );
  }
}
