import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  // get _router => GoRouter()

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // URI String 샅애 및 Go Router에서 사용할 수 있는 형태로 변환해주는 함수
      // routeInformationParser: ,
      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      // routerDelegate: ,
    );
  }
}
