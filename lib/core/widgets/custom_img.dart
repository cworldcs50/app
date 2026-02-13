import 'package:flutter/material.dart';

class CustomImg extends StatelessWidget {
  const CustomImg({super.key, required this.imgPath, required this.imgColor});

  final String imgPath;
  final Color imgColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      fit: BoxFit.fitWidth,
      color: imgColor,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3,
    );
  }
}
