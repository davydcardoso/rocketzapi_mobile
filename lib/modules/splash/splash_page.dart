import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rocketzapi_adm/shared/auth/auth_controller.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';
import 'package:rocketzapi_adm/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.verifyUserSession(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              AppImages.logoRocket,
              width: size.width,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
