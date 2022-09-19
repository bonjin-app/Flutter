import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/screen/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.push('/one');
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => OneScreen(),
              //   ),
              // );
            },
            child: Text('Screen One (GO)'),
          ),
        ],
      ),
    );
  }
}
