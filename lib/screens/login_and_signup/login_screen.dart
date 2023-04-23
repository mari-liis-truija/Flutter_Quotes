import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/screens/home_screen.dart';
import 'package:flutter_quotes/screens/login_and_signup/signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgimg.jpg"),
              fit: BoxFit.fill,
              opacity: 0.91,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(15.0),
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
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.8,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.8,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  50.heightBox,
                  OutlinedButton(
                      onLongPress: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(450, 45)),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 255, 255, .3))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                      },
                      child: Text(
                        "Login",
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
                      "Don't have an account?".text.color(Colors.white).make(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
