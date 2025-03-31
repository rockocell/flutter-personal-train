import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String selectedDeparture;
  final String selectedArrival;

  const SeatPage({
    super.key,
    required this.selectedDeparture,
    required this.selectedArrival,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRowNum;
  int? selectedColNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedStation(widget.selectedDeparture),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              selectedStation(widget.selectedArrival),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                  ...List.generate(20, (index) {
                    int rowNum = index + 1;
                    return Padding(
                      padding:
                          rowNum != 20
                              ? const EdgeInsets.only(bottom: 8)
                              : EdgeInsets.zero,
                      child: row(rowNum),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: SizedBox(
              height: 50,
              width: double.infinity,

              /// 버튼
              ///
              child: ElevatedButton(onPressed: () {}, child: Text('예매 하기')),
            ),
          ),
        ],
      ),
    );
  }

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

  Row row(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(rowNum, 1),
        SizedBox(width: 4),
        seat(rowNum, 2),
        SizedBox(width: 4),
        textBox('$rowNum'),
        SizedBox(width: 4),
        seat(rowNum, 3),
        SizedBox(width: 4),
        seat(rowNum, 4),
      ],
    );
  }

  Widget seat(int rowNum, int colNum) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRowNum = rowNum;
          selectedColNum = colNum;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color:
              selectedRowNum == rowNum && selectedColNum == colNum
                  ? Colors.purple
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Expanded selectedStation(String stationName) {
    return Expanded(
      child: Center(
        child: Text(
          stationName,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
