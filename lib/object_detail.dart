// ignore_for_file: prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace

import 'package:e_commerce_demo_app/description.dart';
import 'package:e_commerce_demo_app/full_image.dart';
import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/rating_star.dart';
import 'package:e_commerce_demo_app/review.dart';
import 'package:e_commerce_demo_app/specification.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ObjectDetails extends StatefulWidget {
  Item item;
  ObjectDetails({super.key, required this.item});

  //create list of list == [[id, value]] for specification
  @override
  State<StatefulWidget> createState() {
    return ObjectDetailsState(product: item);
  }
}

class ObjectDetailsState extends State<ObjectDetails> {
  Item product;
  var _controller = PageController();
  var isDPressed = true;
  var isSPressed = false;
  var isRPressed = false;
  ObjectDetailsState({required this.product});
  var prodKey = [
    "id",
    "title",
    "description",
    "price",
    "discountPercentage",
    "rating",
    "stock",
    "brand",
    "category",
    "thumbnail"
  ];
  Widget callBtn() {
    if (isDPressed) {
      return Description(description: product.description);
    } else if (isSPressed) {
      return Specification(item: product, keyList: prodKey);
    } else {
      return Review(product: product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height * 0.6) - 10,
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: product.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Image(
                            height:
                                (MediaQuery.of(context).size.height * 0.6) - 10,
                            image: NetworkImage(product.images[index]),
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FullImages(images: product.images)),
                            );
                          },
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: product.images.length,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            height: (MediaQuery.of(context).size.height * 0.1) + 20,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5),
                  width: (MediaQuery.of(context).size.width * 0.3) + 10,
                  // color: Color.fromARGB(255, 147, 178, 203),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color.fromARGB(255, 165, 196, 200),
                  ),
                  child: RatingStar(ratingStar: double.parse(product.rating)),
                ),
                Text(
                  product.title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      "${product.discountPercentage}% off  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromARGB(255, 25, 87, 34)),
                    ),
                    Stack(
                      fit: StackFit.loose,
                      alignment: AlignmentDirectional.center,
                      children: [
                        Text(
                          "20000 ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color.fromARGB(255, 73, 73, 73)),
                        ),
                        Container(
                          width: 65,
                          height: 2,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Text(
                      "  ₹${product.price}",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 68, 68, 68)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[50],
            width: (MediaQuery.of(context).size.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isRPressed = false;
                            isDPressed = true;
                            isSPressed = false;
                          });
                        },
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: isDPressed
                                ? Colors.white
                                : Color.fromARGB(255, 3, 56, 60),
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          // disabledBackgroundColor: isDPressed
                          //     ? Color.fromARGB(255, 3, 56, 60)
                          //     : Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: isDPressed
                              ? Color.fromARGB(255, 3, 56, 60)
                              : Color.fromARGB(255, 255, 255, 255),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isRPressed = false;
                            isDPressed = false;
                            isSPressed = true;
                          });
                        },
                        child: Text(
                          "Specification",
                          style: TextStyle(
                            color: isSPressed
                                ? Colors.white
                                : Color.fromARGB(255, 3, 56, 60),
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSPressed
                              ? Color.fromARGB(255, 3, 56, 60)
                              : Color.fromARGB(255, 255, 255, 255),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isRPressed = true;
                            isDPressed = false;
                            isSPressed = false;
                          });
                        },
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            color: isRPressed
                                ? Colors.white
                                : Color.fromARGB(255, 3, 56, 60),
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isRPressed
                              ? Color.fromARGB(255, 3, 56, 60)
                              : Color.fromARGB(255, 255, 255, 255),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        )),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  // height: (MediaQuery.of(context).size.height * 0.3) - 50,
                  // width: double.infinity,
                  color: Colors.grey[50],
                  child: callBtn(),
                )
              ],
            ),
          )
        ],
      )),
    ));
  }
}
