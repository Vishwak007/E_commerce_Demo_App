import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int ratingCount;
  final double size;
  final double ratingStar;
  RatingStar(
      {super.key,
      required this.ratingStar,
      this.ratingCount = 0,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    int realNumber = ratingStar.floor();
    int partNumber = ((ratingStar - realNumber) * 10).ceil();
    List<Widget> listOfStar = [];
    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        listOfStar.add(Icon(
          Icons.star,
          color: Colors.amber,
          size: size,
        ));
      } else if (i == realNumber) {
        listOfStar.add(SizedBox(
          width: size,
          height: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: size,
              ),
              ClipRect(
                clipper: clipper(part: partNumber),
                child: Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: size,
                ),
              )
            ],
          ),
        ));
      } else {
        listOfStar.add(Icon(
          Icons.star,
          color: Colors.grey,
          size: size,
        ));
      }
    }
    listOfStar.add(Text(
      " $ratingStar",
      style: TextStyle(fontSize: 11, color: Colors.blue),
    ));

    return Row(
      children: listOfStar,
    );
  }
}

class clipper extends CustomClipper<Rect> {
  int part;
  clipper({required this.part});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
