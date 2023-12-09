import 'package:dahab/core/theme/theme_data.dart';
import 'package:dahab/features/login/domain/user_provider.dart';
import 'package:dahab/home.dart';
import 'package:dahab/core/utilities/route_names.dart';
import 'package:dahab/core/utilities/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features/scan/scan_screen.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            routes: {
              RouteNames.scanPage: (context) => ScanScreen(),
              RouteNames.homePage: (context) => const Home(),
            },
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: AppTheme.themeData,
            home: child,
          );
        },
        child: const Home(),
      ),
    );
  }
}



