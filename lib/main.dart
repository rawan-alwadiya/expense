import 'package:expense/models/constants.dart';
import 'package:expense/screens/home.dart';
import 'package:expense/screens/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Expenses',
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldColor,
            appBarTheme: AppBarTheme(
              backgroundColor: primaryColor,
            ),
          iconTheme: IconThemeData(
            size: 23.sp,
            color: secondaryColor,
          ),
        ),
        // home: Home(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => const LaunchScreen(),
          '/home':(context) => const Home(),
        },
      );
    });
  }
}
