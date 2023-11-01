import 'package:flutter/material.dart';

class FullImages extends StatelessWidget {
  List<String> images;
  FullImages({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image(
                height: (MediaQuery.of(context).size.height),
                image: NetworkImage(images[index]),
                fit: BoxFit.contain,
              );
            }),
      ),
    );
  }
}
