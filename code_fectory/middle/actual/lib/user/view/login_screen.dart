import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: '이메일을 입력해주세요',
            onChanged: (value) {},
          ),
          CustomTextFormField(
            obscureText: true,
            hintText: '비밀번호를 입력해주세요',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
