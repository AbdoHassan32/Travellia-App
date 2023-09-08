import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/register_cubit/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  late String? email;
  late String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          GoRouter.of(context).go(AppRouter.kHomeView,extra: email);
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
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
                                'Register',
                                style: Styles.textStyle29,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CustomTextFormField(
                              onChanged: (data) {
                                email = data;
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
                            child: CustomTextFormField(
                              onChanged: (data) {
                                password = data;
                              },
                              label: 'Password',
                              isPassword: true,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButtonWidget(
                            label: 'Register',
                            buttonColor: Colors.blue,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                        email: email!, password: password!);
                              } else {
                                showSnackBar(context, 'There is an error');
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?',
                                  style: Styles.textStyle14),
                              TextButton(
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                  },
                                  child: const Text('Login')),
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
      },
    );
  }
}

void showSnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red[800],
      content: Text(
        message,
      ),
    ),
  );
}
