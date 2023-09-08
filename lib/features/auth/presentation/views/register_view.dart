import 'package:flutter/material.dart';
import 'package:travellia/features/auth/presentation/views/widgets/Register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  RegisterViewBody(),
    );
  }
}
