import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDateWidget extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const CardDateWidget({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<CardDateWidget> createState() => _CardDateWidgetState();
}

class _CardDateWidgetState extends State<CardDateWidget> {
  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(TextEditingController controller) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          controller.text = DateFormat('dd/MM/yyyy').format(picked);
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Text(
            '${widget.text} - ',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              style: const TextStyle(color: Colors.black),
              readOnly: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                suffixIcon: Icon(Icons.date_range_outlined),
                labelText: 'Дата',
              ),
              onTap: () async {
                await selectDate(widget.controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
