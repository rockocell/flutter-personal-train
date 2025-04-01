import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/data/station_data.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? selectedDeparture;
  final String? selectedArrival;

  const StationListPage({
    super.key,
    required this.title,
    required this.selectedDeparture,
    required this.selectedArrival,
  });

  @override
  Widget build(BuildContext context) {
    /// selectedArrival or selectedDeparture 이 null인지 아닌지에 따라 필터링된 리스트 생성
    /// 해당사항 없는 경우 전체 리스트를 그대로 필터링된 리스트에 할당
    ///
    List<String> filteredList =
        stationList.where((station) {
          if (title == '출발역' && selectedArrival != null) {
            return station != selectedArrival;
          } else if (title == '도착역' && selectedDeparture != null) {
            return station != selectedDeparture;
          }
          return true;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children:
            filteredList
                .map((station) => stationItem(station, context))
                .toList(), //filteredList의 요소를 가져와 레이아웃 구성
      ),
    );
  }

  Widget stationItem(String station, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, station);
      },
      child: Column(
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
                station,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
