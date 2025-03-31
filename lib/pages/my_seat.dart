import 'package:flutter/material.dart';

class MySeat extends StatelessWidget {
  const MySeat({
    super.key,
    required this.selectedRowNum,
    required this.selectedColStr,
  });

  final int? selectedRowNum;
  final String? selectedColStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('예매 확인'),
      ),
      body: ListView(children: [Column()]),
    );
  }
}
