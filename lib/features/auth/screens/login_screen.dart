import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/utils/utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void initState() {
    super.initState();
    print('initState login screen');
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
        print('Select country: ${country!.displayName}');
        print(country!.phoneCode);
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      print('${country!.phoneCode} ${phoneNumber}');
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: '국가와 휴대폰 번호를 확인하세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('휴대폰 번호 인증'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => pickCountry(),
              child: Text(
                '나라를 선택하세요',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (country != null)
                  Text(
                    '+${country!.phoneCode}',
                    style: TextStyle(fontSize: 30),
                  ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'XXX-XXXX-XXXX',
                      hintStyle: TextStyle(fontSize: 20),
                      labelStyle: TextStyle(fontSize: 20),
                    ),
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length > 5) {
                        setState(() {
                          value = 'aaaaa';
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('번호를 입력하세요'),
            SizedBox(
              height: size.width * 0.5,
            ),
            ElevatedButton(
              onPressed: sendPhoneNumber,
              child: Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
