import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/common_size.dart';
import 'package:instagramtworecord/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.width,
          color: Colors.black,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(common_s_gap),
              child: Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 20,
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
