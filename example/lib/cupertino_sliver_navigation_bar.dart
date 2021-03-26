import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExCupertinoSliverNavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Example'),
            ),
          ];
        },
        body: Center(
          child: Text("ExamplePage"),
        ),
      ),
    );
  }
}