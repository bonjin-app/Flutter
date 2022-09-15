import 'package:flutter/material.dart';
import 'package:state_management/screen/state_provider_screen.dart';

import '../layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '홈',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateProviderScreen()));
            },
            child: Text('StateProviderScreen'),
          ),
        ],
      ),
    );
  }
}
