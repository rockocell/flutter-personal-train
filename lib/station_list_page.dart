import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/station_data.dart';

class StationListPage extends StatelessWidget {
  final String title;

  const StationListPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
            stationList
                .map((station) => stationItem(station, context))
                .toList(),
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
