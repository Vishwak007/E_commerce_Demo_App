import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String description;
  Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      height: (MediaQuery.of(context).size.height * 0.3) - 50,
      width: double.infinity,
      child: Text(
        description,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
