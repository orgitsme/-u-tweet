import 'package:flutter/material.dart';
import 'package:u_tweet/components/my_button.dart';
import 'package:u_tweet/components/my_loading_circle.dart';
import 'package:u_tweet/components/my_text_feild.dart';
import 'package:u_tweet/services/auth/auth_service.dart';
import 'package:u_tweet/services/database/database_service.dart';
 
/*
Register page 
- name
- email
- password
- confirm password
*/

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = AuthService();
  final _db = DatabaseService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void register() async {
  if (passwordController.text == confirmpasswordController.text) {
    showLoadingCircle(context); // Show loading circle while registering
    try {
      await _auth.registerEmailPassword(
        emailcontroller.text,
        passwordController.text,
      );
      if (mounted) hideLoadingCircle(context); // Hide loading circle

      await _db.saveUserInfoFirebase(
        name: emailcontroller.text,
        email: passwordController.text,
      );
    } catch (e) {
      if (mounted) hideLoadingCircle(context);
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Icon(
                  Icons.lock_open_rounded,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 25),

                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextFeild(
                  controller: nameController,
                  hintText: "Enter Name",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextFeild(
                  controller: emailcontroller,
                  hintText: "Enter Email",
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextFeild(
                  controller: passwordController,
                  hintText: "Enter Password",
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextFeild(
                  controller: confirmpasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                MyButton(text: "Register", onTap: register),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
