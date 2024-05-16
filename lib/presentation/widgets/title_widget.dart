import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15),
      child: Text(
        'Данные книжного издательства',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
      ),
    );
  }
}
