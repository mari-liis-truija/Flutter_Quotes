import 'package:flutter/material.dart';
import 'package:flutter_quotes/drawer/drawer_option.dart';
import 'package:velocity_x/velocity_x.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: Color.fromRGBO(255, 255, 255, .9),
    child: ListView(
      children: [
        DrawerHeader(
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(),
          child: Column(children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                  maxRadius: 32,
                ),
                15.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                    ),
                    const Text(
                      "john.doe@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                    Colors.black,
                  )),
                  onPressed: () {},
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.8,
                    ),
                  )),
            )
          ]),
        ),
        drawerOption(),
      ],
    ),
  );
}
