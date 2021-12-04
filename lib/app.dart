import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_government/ui/pages/main/main_page.dart';
import 'package:my_government/utils/colors.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();
  ScaffoldMessengerState get appMessenger => _messengerKey.currentState!;

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Government',
          theme: ThemeData(
            fontFamily: 'Gilroy',
            primaryColor: AppColors.primaryColor,
          ),
          home: MainPage(),
        );
      },
    );
  }
}
