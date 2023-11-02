// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/rating_star.dart';
import 'package:flutter/material.dart';

class MyCartItem extends StatelessWidget {
  final Item product;
  final int quantity;
  const MyCartItem({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image(
                    image: NetworkImage(product.thumbnail),
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                //name and rating
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and rating
                    SizedBox(
                      width: 150,
                      child: Text(
                        product.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    //rating
                    RatingStar(ratingStar: double.parse(product.rating))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 0,
                ),
                //Quantity,
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 22,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    'Qty:$quantity',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // discount price
                Text(
                  "${product.discountPercentage}% off",
                  style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 32, 107, 35)),
                ),
                Text(
                  '  ₹${product.price}',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Sized box and elevated button for remove
            SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 230, 0),
                      disabledBackgroundColor:
                          Color.fromARGB(255, 221, 202, 27),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: null,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 254, 254, 254),
                        size: 30,
                      ),
                      Text(
                        "Remove",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
