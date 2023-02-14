import 'package:flutter/material.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/screens/mobile_home_screen.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';

import 'common/widgets/error_screen.dart';
import 'features/auth/screens/user_information_screen.dart';
import 'features/lane/screens/create_lane_screen.dart';
import 'features/timer/screens/timer_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route login screen');
          return LoginScreen();
        },
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) {
          print('=> route otp screen');
          return OTPScreen(verificationId: verificationId);
        },
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route user information screen');
          return UserInformationScreen();
        },
      );
    case TimerScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route timer screen');
          return TimerScreen();
        },
      );
    case MobileLayoutScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route mobile layout screen');
          return MobileLayoutScreen();
        },
      );
    case MobileHomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route mobile home screen');
          return MobileHomeScreen();
        },
      );
    case CreateLaneScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          print('=> route create lane screen');
          return CreateLaneScreen();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorScreen(
            error: '존재하지 않는 페이지 입니다',
          ),
        ),
      );
  }
}
