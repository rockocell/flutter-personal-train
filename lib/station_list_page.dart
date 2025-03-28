import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('출발역'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          stationItem('수서'),
          stationItem('동탄'),
          stationItem('평택지제'),
          stationItem('천안아산'),
          stationItem('오송'),
          stationItem('대전'),
        ],
      ),
    );
  }

  Column stationItem(String string) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              string,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
