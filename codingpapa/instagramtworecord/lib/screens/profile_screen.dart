import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
          ],
        ),
      ),
    );
  }

  Row _appbar() {
    return Row(
            children: [
              SizedBox(width: 44,),
              Expanded(
                child: Text('BONJIN', textAlign: TextAlign.center,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ],
          );
  }
}
