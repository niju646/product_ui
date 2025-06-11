import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/router/app_route_constants.dart';
import 'package:product_ui/widgets/textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget space = const SizedBox(
      height: 20,
    );
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xFF4A7AFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                space,
                const Align(
                    alignment: Alignment.centerLeft, child: Text("Username")),
                formfield("contact@dscodetech.com",
                    controller: usernameController),
                space,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email"),
                ),
                formfield("contact@dscodetech.com",
                    controller: emailController),
                space,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("password"),
                ),
                formfield("password",
                    controller: passwordController,
                    context: context,
                    isBool: true),
                space,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A7AFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {
                        if (usernameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: const Text("Successfully signup"),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          );
                          GoRouter.of(context)
                              .pushNamed(MyAppCostants().homeRouteName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: const Text("Empty fields"),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(MyAppCostants().loginRouteName);
                        },
                        child: const Text("Login"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
