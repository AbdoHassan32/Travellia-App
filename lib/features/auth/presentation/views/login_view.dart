import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travellia/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  LoginViewBody(),
    );
  }
}
