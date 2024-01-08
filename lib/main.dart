import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvapp/mainscreen.dart';
import 'package:mvapp/services/pagenotifier.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => PageNotifier())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: MainScreen(),
        );
      },
    );
  }
}