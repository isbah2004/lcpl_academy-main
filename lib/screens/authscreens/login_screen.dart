import 'package:flutter/material.dart';
import 'package:lcpl_academy/provider/loading_provider.dart';
import 'package:lcpl_academy/provider/password_visibility_provider.dart';
import 'package:lcpl_academy/reusablewidgets/reusable_button.dart';
import 'package:lcpl_academy/reusablewidgets/reusable_text_field.dart';
import 'package:lcpl_academy/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableTextField(
                hintText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                prefix: const Icon(Icons.alternate_email),
                validator: Utils.emailValidator,
                onFieldSubmitted: (value) {
                  Utils.changeFocus(
                      currentFocus: emailFocusNode,
                      nextFocus: passwordFocusNode,
                      context: context);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<PasswordVisibilityProvider>(
                builder: (BuildContext context,
                    PasswordVisibilityProvider value, Widget? child) {
                  return ReusableTextField(
                    focusNode: passwordFocusNode,
                    hintText: 'Password',
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: value.visibility,
                    prefix: const Icon(Icons.lock),
                    validator: Utils.passwordValidator,
                    suffix: GestureDetector(
                      onTap: () {
                        value.setVisibility();
                      },
                      child: Icon(value.visibility
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<AuthProvider>(
                builder:
                    (BuildContext context, AuthProvider value, Widget? child) {
                  return ReusableButton(
                      title: 'Login',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          value.signInWithEmail(
                              emailController.text, passwordController.text);
                        }
                      },
                      loading: value.loading);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
