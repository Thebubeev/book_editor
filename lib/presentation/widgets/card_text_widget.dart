import 'package:flutter/material.dart';

class CardTextWidget extends StatelessWidget {
  final String text;
  final String? initialText;
  final bool isNumber;
  final TextEditingController controller;
  const CardTextWidget(
      {super.key,
      required this.controller,
      required this.isNumber,
      required this.text,
      this.initialText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Text(
            '$text - ',
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
          Expanded(
            child: TextFormField(
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
              controller: controller,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
