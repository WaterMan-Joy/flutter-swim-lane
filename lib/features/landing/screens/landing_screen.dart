import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

import '../../../common/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
    print('login screen button click');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'SWIM SNS',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset('assets/mool.png'),
            SizedBox(height: size.height * 0.05),
            Text('로그인'),
            SizedBox(height: size.height * 0.05),
            CustomButton(
              text: '로그인',
              onPressed: () => navigateToLoginScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
