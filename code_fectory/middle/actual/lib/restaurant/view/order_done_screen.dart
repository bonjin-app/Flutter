import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/default_layout.dart';

class OrderDoneScreen extends StatelessWidget {
  static String get routeName => 'order_done';

  const OrderDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up_alt_outlined,
              color: PRIMARY_COLOR,
              size: 50,
            ),
            const SizedBox(
              height: 32,
            ),
            Text('결제가 완료되었습니다.', textAlign: TextAlign.center,),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('홈으로'),
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
