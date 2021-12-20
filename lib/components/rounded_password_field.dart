import 'package:flutter/material.dart';
import 'package:rocketzapi_adm/components/text_field_container.dart';
import 'package:rocketzapi_adm/constants.dart';
import 'package:rocketzapi_adm/shared/themes/app_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: AppColors.primary,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: AppColors.primary,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
