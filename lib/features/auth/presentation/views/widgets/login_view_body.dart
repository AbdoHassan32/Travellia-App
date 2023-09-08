import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/assets.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/core/widgets/custom_button_widget.dart';
import 'package:travellia/core/widgets/custom_text_form_field.dart';
import 'package:travellia/features/auth/presentation/views/widgets/Register_view_body.dart';

import '../../manager/login_cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  late String ? email;
 late String ? password;
  bool isLoading=false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context ,state){
        if(state is LoginLoading)
        {
        isLoading = true;
        } 
        else if(state is LoginSuccess)
        {
          isLoading = false;
          GoRouter.of(context).go(AppRouter.kHomeView, extra : email);
        }
        else if (state is LoginFailure)
        {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
          },
        builder: (context ,state ){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AssetsData.testImage1,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kSplashBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AssetsData.logo,
                            height: MediaQuery.of(context).size.height * 0.25,
                            alignment: Alignment.center,
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Login',
                                style: Styles.textStyle29,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child:  CustomTextFormField(
                              onChanged: (data){
                                email=data;
                              },
                              label: 'Email',
                              isPassword: false,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child:  CustomTextFormField(
                              onChanged: (data){
                                password=data;
                              },
                              label: 'Password',
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButtonWidget(
                            label: 'Login',
                            buttonColor: Colors.blue,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).LogInUser(email: email!, password: password!);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?',
                                  style: Styles.textStyle14),
                              TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).push(AppRouter.kRegisterView);
                                  },
                                  child: const Text('Sign Up')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
    }
    );
  }
}
