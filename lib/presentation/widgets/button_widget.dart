import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() function;
  final String text;
  const ButtonWidget({super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
        height: 60,
        width: 250,
        child: Center(
            child: Text(text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ))),
      ),
    );
  }
}
