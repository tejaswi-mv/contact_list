import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: unused_import
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:myapp/services/AuthService.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;  
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Login",
              style:
                  GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Email cannot be empty." : null,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextFormField(
                  validator: (value) => value!.length < 8
                      ? "Password should have atleast 8 characters."
                      : null,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * .9,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthService()
                            .loginWithEmail(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value == "Login Successful") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Successful")));
                            Navigator.pushReplacementNamed(context, "/home");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red.shade400,
                            ));
                          }
                        });
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ))),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width * .9,
              child: OutlinedButton(
                  onPressed: () {
                    AuthService().continueWithGoogle().then((value) {
                      if (value == "Google Login Successful") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Google Login Successful")));
                        Navigator.pushReplacementNamed(context, "/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red.shade400,
                        ));
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have and account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: Text("Sign Up"))
              ],
            )
          ]),
        ),
      ),
    );
    }
  }
