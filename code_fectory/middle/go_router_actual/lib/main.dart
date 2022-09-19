import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/screen/error_screen.dart';
import 'package:go_router_actual/screen/home_screen.dart';
import 'package:go_router_actual/screen/one_screen.dart';
import 'package:go_router_actual/screen/three_screen.dart';
import 'package:go_router_actual/screen/two_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  _App({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
        initialLocation: '/',
        errorBuilder: (context, state) {
          return ErrorScreen(error: state.error.toString());
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'one',
                builder: (context, state) => OneScreen(),
                routes: [
                  GoRoute(
                    path: 'two',
                    builder: (context, state) => TwoScreen(),
                    routes: [
                      GoRoute(
                        path: 'three',
                        name: ThreeScreen.routeName,
                        builder: (context, state) => ThreeScreen(),
                      ),
                    ]
                  ),
                ]
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Router정보를 전달
      routeInformationProvider: _router.routeInformationProvider,
      // URI String 샅애 및 Go Router에서 사용할 수 있는 형태로 변환해주는 함수
      routeInformationParser: _router.routeInformationParser,
      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      routerDelegate: _router.routerDelegate,
    );
  }
}
