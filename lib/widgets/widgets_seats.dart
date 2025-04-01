import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/seat_data.dart';

Widget seat(BuildContext context, int rowNum, String colStr) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color:
          selectedRowGlobal == rowNum && selectedColGlobal == colStr
              ? Colors.purple
              : Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

Widget textBox(String text) => Container(
  width: 50,
  height: 50,
  alignment: Alignment.center,
  child: Text(text, style: TextStyle(fontSize: 18)),
);
