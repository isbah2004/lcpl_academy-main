import 'package:flutter/material.dart';
import 'package:lcpl_academy/reusablewidgets/neomorphism_widget.dart';
import 'package:lcpl_academy/reusablewidgets/reusable_button.dart';
import 'package:lcpl_academy/reusablewidgets/reusable_text_field.dart';
import 'package:lcpl_academy/utils/utils.dart';

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
              ReusableTextField(
                focusNode: passwordFocusNode,
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                prefix: const Icon(Icons.lock_open_rounded),
                validator: Utils.passwordValidator,
              ),
              const SizedBox(height: 30),
              const ReusableButton(),
            ],
          ),
        ),
      ),
    );
  }
}
