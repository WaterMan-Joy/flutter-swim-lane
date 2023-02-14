import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_ui/router.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp_ui/screens/mobile_home_screen.dart';
import 'package:whatsapp_ui/screens/mobile_layout_screen.dart';
import 'package:whatsapp_ui/theme/pallete.dart';
import 'common/widgets/error_screen.dart';
import 'common/widgets/loader.dart';
import 'firebase_options.dart';

void main() async {
  print('main app');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWIM SNS',
      theme: Pallete.lightModeAppTheme,
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if (user == null) {
              return LandingScreen();
            }
            return MobileHomeScreen();
          },
          error: (error, StackTrace) {
            return ErrorScreen(error: error.toString());
          },
          loading: () => Loader()),
    );
  }
}
