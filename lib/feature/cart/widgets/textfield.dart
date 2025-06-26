import 'package:flutter/material.dart';
import 'package:product_ui/feature/cart/providers/auth_provider.dart';
import 'package:provider/provider.dart';

Widget formfield(String name,
    {bool isBool = false,
    required TextEditingController controller,
    BuildContext? context}) {
  if (!isBool) {
    return TextFormField(
      controller: controller,
      obscureText: isBool,
      decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          )),
    );
  }
  return Consumer<AuthProvider>(
    builder: (context, visiblityprovider, child) {
      return TextFormField(
        controller: controller,
        obscureText: !visiblityprovider.isVisible,
        decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).visiblity();
              },
              icon: Icon(
                visiblityprovider.isVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              )),
        ),
      );
    },
  );
}
