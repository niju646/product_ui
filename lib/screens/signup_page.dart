import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_ui/router/app_route_constants.dart';

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
                signupfield("contact@dscodetech.com",
                    controller: usernameController),
                space,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email"),
                ),
                signupfield("contact@dscodetech.com",
                    controller: emailController),
                space,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("password"),
                ),
                signupfield("password",
                    controller: passwordController, isBool: true),
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
                        // Provider.of<AuthProvider>(context).login();
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Home()));
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
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => LoginPage()));
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

  TextFormField signupfield(String name,
          {bool isBool = false, required TextEditingController controller}) =>
      TextFormField(
        controller: controller,
        obscureText: isBool,
        decoration: InputDecoration(
            hintText: name,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
      );
}
