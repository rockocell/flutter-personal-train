import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/seat_data.dart';
import 'package:flutter_train_seat_app/data/station_data.dart';
import 'package:flutter_train_seat_app/widgets/display_station_name.dart';
import 'package:flutter_train_seat_app/pages/home_page.dart';
import 'package:flutter_train_seat_app/pages/my_seat.dart';

class MyTicket extends StatelessWidget {
  const MyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text('예매 확인'),

        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ], // 홈 버튼 터치 시 HomePage이동
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        displayStationName(
                          title: '출발역',
                          selected: selectedDepartureGlobal,
                        ),
                        SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 2.0,
                          ),
                        ),
                        displayStationName(
                          title: '도착역',
                          selected: selectedArrivalGlobal,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Text(
                      '좌석위치 $selectedRowGlobal - $selectedColGlobal',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buttonToMySeat(context), //ElevatedButton: MySeat로 넘어가기
          ],
        ),
      ),
    );
  }

  Widget buttonToMySeat(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MySeat()),
          );
        },
        child: Text('좌석 위치 확인'),
      ),
    );
  }
}
