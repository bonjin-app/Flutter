import 'package:actual/common/utils/data_utils.dart';
import 'package:dio/dio.dart';

import '../../common/model/login_response.dart';
import '../../common/model/token_response.dart';

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final serialized = DataUtils.plaintToBase64('$username:$password');
    final response = await dio.post('$baseUrl/login',
        options: Options(
          headers: {
            'authorization': 'Basic $serialized',
          },
        ));

    return LoginResponse.fromJson(response.data);
  }

  Future<TokenResponse> token() async {
    final response = await dio.post(
      '$baseUrl/token',
      options: Options(
        headers: {'refreshToken': 'true'},
      ),
    );

    return TokenResponse.fromJson(response.data);
  }
}
