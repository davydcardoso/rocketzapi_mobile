import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rocketzapi_adm/shared/models/user_model.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/dashboard',
          arguments: <String, String>{
            'token': user.token,
            'name': user.name,
            'email': user.email,
            'company': user.company,
          });
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('token', user.token);
    await instance.setString('name', user.name);
    await instance.setString('email', user.email);
    await instance.setString('company', user.company);
    return;
  }

  Future<void> verifyUserSession(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 2));

    if (instance.containsKey('token')) {
      final token = instance.get('token') as String;
      final name = instance.get('name') as String;
      final email = instance.get('email') as String;
      final company = instance.get('company') as String;

      final user = UserModel(
        name: name,
        token: token,
        email: email,
        company: company,
      );

      setUser(context, user);
      return;
    }

    setUser(context, null);
  }
}
