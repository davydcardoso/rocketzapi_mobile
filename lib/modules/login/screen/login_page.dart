import 'package:flutter/material.dart';
import 'package:rocketzapi_adm/modules/login/components/body.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Body(),
    );
  }
}
