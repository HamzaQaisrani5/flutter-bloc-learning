import 'dart:developer';

import 'package:fl_bloc/login_form_app/bloc/auth_bloc.dart';
import 'package:fl_bloc/login_form_app/pages/home_page.dart';
import 'package:fl_bloc/login_form_app/pages/widgets/gradient_button.dart';
import 'package:fl_bloc/login_form_app/pages/widgets/login_field.dart';
import 'package:fl_bloc/login_form_app/pages/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (_, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AuthInitial) {
            return SingleChildScrollView(
              child: Center(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key,
                  child: Column(
                    children: [
                      // Image.asset('assets/images/signin_balls.png'),
                      const Text(
                        'Sign in.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const SocialButton(
                        iconPath: '',
                        label: 'Continue with Google',
                      ),
                      const SizedBox(height: 20),
                      const SocialButton(
                        iconPath: 'assets/svgs/f_logo.svg',
                        label: 'Continue with Facebook',
                        horizontalPadding: 90,
                      ),
                      const SizedBox(height: 15),
                      const Text('or', style: TextStyle(fontSize: 17)),
                      const SizedBox(height: 15),
                      LoginField(
                        hintText: 'Email',
                        controller: emailController,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Field not be empty';
                          }
                          return null;
                        },
                        // formKey: _key,
                      ),
                      const SizedBox(height: 15),
                      LoginField(
                        hintText: 'Password',
                        controller: passwordController,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return 'Field not be empty';
                          } else if (password.length < 6) {
                            return 'Must be greater then 6 chars';
                          }
                          return null;
                        },
                        // formKey: _key,
                      ),
                      const SizedBox(height: 20),
                      GradientButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            authBloc.add(
                              AuthRequested(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMsg),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          } else {
            null;
          }
        },
      ),
    );
  }
}
