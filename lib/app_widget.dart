import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rocketzapi_adm/modules/dashboard/screen/dashboard.dart';
import 'package:rocketzapi_adm/modules/login/screen/login_page.dart';
import 'package:rocketzapi_adm/modules/splash/splash_page.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppWidget() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }

    return MaterialApp(
      title: 'Sonik Conciliations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, primaryColor: AppColors.primary),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
