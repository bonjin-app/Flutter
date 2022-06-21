import 'package:flutter/material.dart';
import 'package:instagramtworecord/widgets/fade_stack.dart';
import 'package:instagramtworecord/widgets/sign_in_form.dart';
import 'package:instagramtworecord/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
           FadeStack(selectedForm: selectedForm),
            Container(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (selectedForm == 0) {
                      selectedForm = 1;
                    } else {
                      selectedForm = 0;
                    }
                  });
                },
                child: Text('go to Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
