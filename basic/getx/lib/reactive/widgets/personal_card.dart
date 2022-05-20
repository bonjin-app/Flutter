import 'package:flutter/material.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: const Center(
                child: Text(
                  'Name', style: TextStyle(fontSize: 20, color: Colors.white),

                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: const Center(
                child: Text(
                  'Name', style: TextStyle(fontSize: 20, color: Colors.white),

                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF89DAD0),
              ),
              child: const Center(
                child: Text(
                  'Name', style: TextStyle(fontSize: 20, color: Colors.white),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
