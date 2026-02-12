import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    required this.backgroundColor,
  });

  final void Function() onPressed;
  final Color backgroundColor;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width / 2),
      ),
      child: Text(
        btnTitle,
        style: TextStyle(
          fontSize: 19,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
