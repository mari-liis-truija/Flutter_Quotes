import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/screens/home_screen.dart';
import 'package:flutter_quotes/utils/utilities.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quotes/screens/login_and_signup/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bgimg.jpg"),
                fit: BoxFit.fill,
                opacity: 0.91,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(255, 255, 255, .3)),
                  ],
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.mail_solid,
                      ),
                      prefixIconColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Enter your e-mail",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter e-mail";
                    }
                    return null;
                  },
                ),
              ),
              25.heightBox,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Color.fromRGBO(255, 255, 255, .3)),
                  ],
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.lock_open),
                      prefixIconColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
              ),
              50.heightBox,
              OutlinedButton(
                  onLongPress: () {},
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(450, 45)),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 255, 255, .3))),
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                      auth
                          .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) {})
                          .onError((error, stackTrace) {
                        Utilis().toastMessage(error.toString());
                      });
                    }
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.8,
                      color: Colors.white,
                    ),
                  )),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Already have an account?".text.color(Colors.white).make(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreen(),
                            ));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
