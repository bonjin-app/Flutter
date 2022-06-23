import 'package:flutter/material.dart';

import '../constants/common_size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset(
                'assets/images/insta_text_logo.png',
              ),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _emailController,
                decoration: _buildInputDecoration('Email'),
                validator: (String? text) {
                  if (text!.isNotEmpty && text.contains("@")) {
                    return null;
                  } else {
                    return '이메일을 입력해줘요.';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _passwordController,
                decoration: _buildInputDecoration('Password'),
                obscureText: true,
                validator: (text) {
                  if (text!.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return '비밀번호를 입력해줘요.';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _confirmPasswordController,
                decoration: _buildInputDecoration('Confirm Password'),
                obscureText: true,
                validator: (text) {
                  if (text!.isNotEmpty && _passwordController.text == text) {
                    return null;
                  } else {
                    return '비밀번호를 확인해줘요.';
                  }
                },
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Validation Success");
                  }
                },
                child: Text(
                  'Join',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder: _buildActiveInputBorder(),
        focusedBorder: _buildActiveInputBorder(),
        errorBorder: _buildErrorInputBorder(),
        focusedErrorBorder: _buildErrorInputBorder(),
        filled: true,
        fillColor: Colors.grey[100]);
  }

  OutlineInputBorder _buildErrorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      );
  }

  OutlineInputBorder _buildActiveInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300]!!,
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      );
  }
}
