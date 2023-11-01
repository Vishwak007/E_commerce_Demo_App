import 'package:e_commerce_demo_app/model/Item.dart';
import 'package:e_commerce_demo_app/rating_star.dart';
import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final Item product;
  const Review({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RatingStar(ratingStar: double.parse(product.rating)),
              SizedBox(
                width: 10,
              ),
              Text(
                "Great Product!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Review for: ${product.brand}, ${product.title}",
            maxLines: 1,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 79, 77, 77)),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Detail explanation of the review of this product",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          Text("Govind Sharma, Madhubani",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 109, 109, 109))),
        ],
      ),
    );
  }
}
