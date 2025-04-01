import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/seat_data.dart';
import 'package:flutter_train_seat_app/pages/my_ticket.dart';

import 'package:flutter_train_seat_app/data/station_data.dart';
import 'package:flutter_train_seat_app/widgets/display_snack_bar.dart';
import 'package:flutter_train_seat_app/widgets/widgets_seats.dart'; //seat, textBox 임포트

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
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
          buttonToCupertinoDialog(
            context,
          ), // ElevatedButton: 선택된 자리 있는지 확인, CupertinoDialog 띄우기
        ],
      ),
    );
  }

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

  // widgets_seats.dart의 seat 위젯에 터치로 사용자 입력 받는 기능 추가
  Widget touchableSeat(int rowNum, String colStr) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRowGlobal = rowNum;
          selectedColGlobal = colStr;
        });
      },
      child: seat(context, rowNum, colStr),
    );
  }

  Widget row(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        touchableSeat(rowNum, 'A'),
        SizedBox(width: 4),
        touchableSeat(rowNum, 'B'),
        SizedBox(width: 4),
        textBox('$rowNum'),
        SizedBox(width: 4),
        touchableSeat(rowNum, 'C'),
        SizedBox(width: 4),
        touchableSeat(rowNum, 'D'),
      ],
    );
  }

  //하단 ElevatedButton
  Widget buttonToCupertinoDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (selectedRowGlobal != null && selectedColGlobal != null) {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('예매 하시겠습니까?'),
                    content: Text('좌석 $selectedRowGlobal - $selectedColGlobal'),
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
                            MaterialPageRoute(builder: (context) => MyTicket()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(displaySnackBar('좌석을 선택해 주세요.', bottomMargin: 60));
            }
          },
          child: Text('예매 하기'),
        ),
      ),
    );
  }
}
