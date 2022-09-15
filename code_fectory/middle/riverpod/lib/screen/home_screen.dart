import 'package:flutter/material.dart';
import 'package:riverpod/layout/default_layout.dart';
import 'package:riverpod/screen/state_provider_screen.dart';

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
