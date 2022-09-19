import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/model/user_model.dart';
import 'package:go_router_actual/screen/login_screen.dart';

import '../screen/error_screen.dart';
import '../screen/home_screen.dart';
import '../screen/one_screen.dart';
import '../screen/three_screen.dart';
import '../screen/two_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    // redirect
    redirect: authStateProvider._redirectLogic,
    // refresh
    refreshListenable: authStateProvider,
    routes: authStateProvider._routes,
  );
});

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({
    required this.ref,
  }) {
    ref.listen(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(GoRouterState state) {
    final user = ref.read(userProvider);

    // 로그인을 하려는 상태인지
    final loggingIn = state.location == '/login';

    // 로그인한 상태가 아니다
    // 유저 정보가 없고, 로그인하는 중이 아니라면 로그인 페이지로 이동
    if(user == null) {
      return loggingIn ? null : '/login';
    }

    // 유저 정보가 있는데 로그인 페이지라면 홈으로 이동
    if(loggingIn) {
      return '/';
    }

    return null;
  }

  List<GoRoute> get _routes => [
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
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (_, state) => LoginScreen(),
        ),
      ];
}

final userProvider =
    StateNotifierProvider<UserStateNotifier, UserModel?>((ref) {
  return UserStateNotifier();
});

class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  void login({
    required String name,
  }) {
    state = UserModel(name: name);
  }

  void logout() {
    state = null;
  }
}
