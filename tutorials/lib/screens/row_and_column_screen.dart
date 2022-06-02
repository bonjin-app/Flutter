import 'package:flutter/material.dart';

class RowAndColumnScreen extends StatelessWidget {
  const RowAndColumnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: Colors.red,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    width: 50, height: 50,
                  ),
                ],
              ),
              Container(
                color: Colors.orange,
                width: 50, height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.red,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 50, height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    width: 50, height: 50,
                  ),
                ],
              ),
              Container(
                color: Colors.green,
                width: 50, height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
