import 'package:flutter/material.dart';

import '../constants/common_size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(common_gap),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: common_l_gap,
            ),
            Image.asset('assets/images/insta_text_logo.png',),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.circular(common_s_gap),
                ),
                filled: true,
                fillColor: Colors.grey[100]
              ),
              validator: (text) {
                if(text!.isNotEmpty && text.contains("@")) {
                  return null;
                } else {
                  return '이메일을 입력해줘요.';
                }
              },
            ),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
