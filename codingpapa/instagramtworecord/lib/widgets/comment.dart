import 'package:flutter/material.dart';

import '../constants/common_size.dart';
import 'rounded_avatar.dart';

class Comment extends StatelessWidget {
  Comment({
    Key? key,
    this.showImage = true,
    required this.username,
    required this.text,
    required this.dateTime,
  }) : super(key: key);

  final bool showImage;
  final String username;
  final String text;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage)
          RoundedAvatar(
            size: 24,
          ),
        SizedBox(
          width: common_xxs_gap,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              dateTime.toIso8601String(),
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            )
          ],
        ),
      ],
    );
  }
}
