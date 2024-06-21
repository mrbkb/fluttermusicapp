import 'package:client/core/theme/app_palette.dart';
import 'package:client/features/auth/view/widget/auth_gradient_button.dart';
import 'package:client/features/auth/view/widget/custom_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formkey.currentState!.validate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                controller: passwordController,
                hintText: "Password",
                isObscuredText: true,
              ),
              const SizedBox(
                height: 20,
              ),
               AuthGradientButton(onTap:(){}, buttonText: "Sign In",),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    text: "Don't have an account?  ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      const TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: Pallete.gradient2,
                              fontWeight: FontWeight.bold))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
