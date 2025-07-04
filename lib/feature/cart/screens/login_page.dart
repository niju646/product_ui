import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:product_ui/core/services/login_service.dart';
import 'package:product_ui/feature/cart/providers/auth_provider.dart';
import 'package:product_ui/core/router/app_route_constants.dart';
import 'package:product_ui/feature/cart/widgets/textfield.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    
    Widget space = const SizedBox(
      height: 20,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A7AFF),
                      fontSize: 40),
                ),
                space,
                const Align(
                    alignment: Alignment.centerLeft, child: Text('Your Email')),
                space,
                formfield("example@gmail.com", controller: emailController),
                space,
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your password')),
                space,
                formfield("Password",
                    isBool: true,
                    controller: passwordController,
                    context: context),
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
                      onPressed: () async {
                        if (passwordController.text.isNotEmpty &&
                            emailController.text.isNotEmpty) {
                              // final authProvider = Provider.of<AuthProvider>(context);
                              bool success = await Provider.of<AuthProvider>(context,listen: false).loginAuth(
                                emailController.text.trim(), passwordController.text.trim());
                              if(success){
                                if(!context.mounted) return;
                                GoRouter.of(context).pushNamed(MyAppCostants().homeRouteName);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login Successfull"),
                                  backgroundColor: Colors.green,
                                  )
                                );
                              }else{
                                if(!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Login Failed"),
                                    backgroundColor: Colors.red,
                                    )
                                );
                              }                    
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: Colors.red,
                              content: const Text('Fill the fields')));
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(MyAppCostants().signupRouteName);
                        },
                        child: const Text('Sign Up'))
                  ],
                ),
            

              ],
            ),
          ),
        ),
      ),
    );
  }
}
