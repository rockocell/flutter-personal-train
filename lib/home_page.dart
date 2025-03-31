import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDeparture;
  String? selectedArrival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('기차 예매')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectStation('출발역', selectedDeparture),
                  SizedBox(width: 40),
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(color: Colors.grey, thickness: 2.0),
                  ),
                  SizedBox(width: 40),
                  selectStation('도착역', selectedDeparture),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: () {}, child: Text('좌석 선택')),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectStation(String title, String? selected) {
    return GestureDetector(
      onTap: () async {
        final selected = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage(title: title),
          ),
        );

        if (selected != null) {
          setState(() {
            if (title == '출발역') {
              selectedDeparture = selected;
            } else {
              selectedArrival = selected;
            }
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(selected ?? '선택', style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
