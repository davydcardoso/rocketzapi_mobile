import 'package:flutter/material.dart';
import 'package:rocketzapi_adm/components/already_have_an_account_acheck.dart';
import 'package:rocketzapi_adm/components/rounded_button.dart';
import 'package:rocketzapi_adm/components/rounded_input_field.dart';
import 'package:rocketzapi_adm/components/rounded_password_field.dart';
import 'package:rocketzapi_adm/modules/login/controllers/login_controller.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';
import 'package:rocketzapi_adm/shared/themes/app_images.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final loginController = LoginController();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
                width: size.width,
                height: size.height * 0.30,
                color: AppColors.primary),
            Positioned(
              top: 55.0,
              left: 0.0,
              right: 0.0,
              child: Image.asset(
                AppImages.logoRocket,
                width: size.width,
                height: 200,
              ),
            ),
            Positioned(
              bottom: size.height * 0.10,
              left: 0.0,
              right: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () async {
                      await loginController.rocketSignIn(
                        context,
                        email,
                        password,
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () async {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
