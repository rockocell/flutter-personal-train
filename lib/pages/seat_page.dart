import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/seat_data.dart';
import 'package:flutter_train_seat_app/pages/my_ticket.dart';
import 'package:flutter_train_seat_app/widgets/display_snack_bar.dart';
import 'package:flutter_train_seat_app/data/station_data.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRowNum;
  String? selectedColStr;

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
              selectedStation(selectedDepartureGlobal),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              selectedStation(selectedArrivalGlobal),
            ],
          ), // 출발역 -> 도착역 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              seatStateBox(Colors.purple, '선택됨'),
              SizedBox(width: 20),
              seatStateBox(
                Theme.of(context).colorScheme.secondaryContainer,
                '선택안됨',
              ),
            ],
          ), // 선택됨 or 선택안됨 색상 알림
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
              child: ElevatedButton(
                onPressed: () {
                  if (selectedRowNum != null && selectedColStr != null) {
                    // null 체크 후 전역변수에 값 전달
                    selectedRowGlobal = selectedRowNum!;
                    selectedColGlobal = selectedColStr!;
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('예매 하시겠습니까?'),
                          content: Text('좌석 $selectedRowNum - $selectedColStr'),
                          actions: [
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              child: Text('취소'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('확인'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyTicket(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      displaySnackBar('좌석을 선택해 주세요.', bottomMargin: 60),
                    );
                  }
                },
                child: Text('예매 하기'),
              ),
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
        seat(rowNum, 'A'),
        SizedBox(width: 4),
        seat(rowNum, 'B'),
        SizedBox(width: 4),
        textBox('$rowNum'),
        SizedBox(width: 4),
        seat(rowNum, 'C'),
        SizedBox(width: 4),
        seat(rowNum, 'D'),
      ],
    );
  }

  Widget seat(int rowNum, String colStr) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRowNum = rowNum;
          selectedColStr = colStr;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color:
              selectedRowNum == rowNum && selectedColStr == colStr
                  ? Colors.purple
                  : Theme.of(context).colorScheme.secondaryContainer,
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
