import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedStation('수서'),
              SizedBox(width: 50),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              SizedBox(width: 50),
              selectedStation('부산'),
            ],
          ), // 출발역 -> 도착역 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              seatStateBox(Colors.purple, '선택됨'),
              SizedBox(width: 20),
              seatStateBox(Colors.grey[300]!, '선택안됨'),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textBox('A'),
                    SizedBox(width: 4),
                    textBox('B'),
                    SizedBox(width: 4),
                    textBox(''),
                    SizedBox(width: 4),
                    textBox('C'),
                    SizedBox(width: 4),
                    textBox('D'),
                  ],
                ),

                seatBoxRow(1),
                SizedBox(height: 8),
                seatBoxRow(2),
                SizedBox(height: 8),
                seatBoxRow(3),
                SizedBox(height: 8),
                seatBoxRow(4),
                SizedBox(height: 8),
                seatBoxRow(5),
                SizedBox(height: 8),
                seatBoxRow(6),
                SizedBox(height: 8),
                seatBoxRow(7),
                SizedBox(height: 8),
                seatBoxRow(8),
                SizedBox(height: 8),
                seatBoxRow(9),
                SizedBox(height: 8),
                seatBoxRow(10),
                SizedBox(height: 8),
                seatBoxRow(11),
                SizedBox(height: 8),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('예매 하기')),
            ),
          ),
        ],
      ),
    );
  }

  Row seatBoxRow(int seatNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        coloredBox(),
        SizedBox(width: 4),
        coloredBox(),
        SizedBox(width: 4),
        textBox('$seatNum'),
        SizedBox(width: 4),
        coloredBox(),
        SizedBox(width: 4),
        coloredBox(),
      ],
    );
  }

  Container coloredBox() => Container(
    width: 50,
    height: 50,

    decoration: BoxDecoration(
      color: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  Container textBox(String text) => Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    child: Text(text, style: TextStyle(fontSize: 18)),
  );

  Row seatStateBox(Color color, String string) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(string),
      ],
    );
  }

  Text selectedStation(String stationName) {
    return Text(
      stationName,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
