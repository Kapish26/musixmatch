import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double size;

  const ImageWidget({
    Key? key,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Image.asset('assets/images/img1.png'),
    );
  }
}
