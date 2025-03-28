import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('기차 예매')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectStation('출발역'),
                  SizedBox(width: 40),
                  SizedBox(
                    height: 48,

                    child: VerticalDivider(
                      color: Colors.black26,
                      thickness: 2.0,
                    ),
                  ),
                  SizedBox(width: 40),
                  selectStation('도착역'),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column selectStation(String string) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(string, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
        Text('선택', style: TextStyle(fontSize: 38)),
      ],
    );
  }
}
