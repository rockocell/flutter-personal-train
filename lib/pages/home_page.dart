import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/pages/station_list_page.dart';
import 'package:flutter_train_seat_app/pages/seat_page.dart';
import 'package:flutter_train_seat_app/widgets/display_snack_bar.dart';
import 'package:flutter_train_seat_app/widgets/display_station_name.dart';
import 'package:flutter_train_seat_app/data/station_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: selectStation('출발역', selectedDepartureGlobal),
                  ),
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(color: Colors.grey, thickness: 2.0),
                  ),
                  Expanded(child: selectStation('도착역', selectedArrivalGlobal)),
                ],
              ),
            ),
            SizedBox(height: 20),
            buttonToSeatPage(
              context,
            ), //ElevatedButton: 출발역, 도착역 null 체크, SeatPage로 넘어가기
          ],
        ),
      ),
    );
  }

  /// displayStationName에 제스처 입혀 사용
  ///
  Widget selectStation(String title, String? selected) {
    return GestureDetector(
      onTap: () async {
        final selected = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder:
                (context) => StationListPage(
                  title: title,
                  selectedArrival: selectedArrivalGlobal,
                  selectedDeparture: selectedDepartureGlobal,
                ),
          ),
        );

        if (selected != null) {
          setState(() {
            if (title == '출발역') {
              selectedDepartureGlobal = selected;
            } else {
              selectedArrivalGlobal = selected;
            }
          });
        }
      },
      child: displayStationName(title: title, selected: selected),
    );
  }

  //하단 ElevatedButton
  Widget buttonToSeatPage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (selectedDepartureGlobal != null &&
              selectedArrivalGlobal != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeatPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              displaySnackBar('출발역과 도착역을 모두 선택해 주세요.', bottomMargin: 100),
            );
          }
        },
        child: Text('좌석 선택'),
      ),
    );
  }
}
