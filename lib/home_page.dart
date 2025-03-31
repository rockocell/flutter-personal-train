import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/station_list_page.dart';
import 'package:flutter_train_seat_app/seat_page.dart';
import 'package:flutter_train_seat_app/show_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDeparture;
  String? selectedArrival;

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
                  Expanded(child: selectStation('출발역', selectedDeparture)),
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(color: Colors.grey, thickness: 2.0),
                  ),
                  Expanded(child: selectStation('도착역', selectedArrival)),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,

              /// 버튼
              ///
              child: ElevatedButton(
                onPressed: () {
                  if (selectedDeparture != null && selectedArrival != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SeatPage(
                              selectedDeparture: selectedDeparture!,
                              selectedArrival: selectedArrival!,
                            ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnackBar('출발역과 도착역을 모두 선택해 주세요.', bottomMargin: 100),
                    );
                  }
                },
                child: Text('좌석 선택'),
              ),
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
            builder:
                (context) => StationListPage(
                  title: title,
                  selectedArrival: selectedArrival,
                  selectedDeparture: selectedDeparture,
                ),
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
