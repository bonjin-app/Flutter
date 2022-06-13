import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
    required this.containerSize,
    this.progressSize = 60,
  }) : super(key: key);

  final double containerSize;
  final double progressSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          child: Image.asset('assets/images/loading_img.gif'),
          width: progressSize,
          height: progressSize,
        ),
      ),
      width: containerSize,
      height: containerSize,
    );
    ;
  }
}
