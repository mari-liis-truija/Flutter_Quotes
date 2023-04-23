import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/constants/catagory_list.dart';
import 'package:flutter_quotes/constants/images_lists.dart';
import 'package:flutter_quotes/constants/text_const.dart';
import 'package:flutter_quotes/catagory_screen/catagory_img_constants.dart';
import 'package:flutter_quotes/drawer/drawer_option.dart';
import 'package:flutter_quotes/drawer/drawer_screen.dart';
import 'package:flutter_quotes/screens/catagory_page.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.85,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            15.heightBox,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: "Quotes Catagory"
                      .text
                      .bold
                      .letterSpacing(1.8)
                      .size(20)
                      .make()),
            ]).box.outerShadowLg.make(),
            10.heightBox,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    transparentImages.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: context.screenHeight / 4.5,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: InkWell(
                                  onTap: () {
                                    switch (index) {
                                      case 0:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    catagory_Page()));

                                        break;
                                      case 1:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  catagory_Page(),
                                            ));
                                        break;
                                      case 2:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  catagory_Page(),
                                            ));
                                        break;
                                      case 3:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  catagory_Page(),
                                            ));

                                        break;
                                      case 4:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  catagory_Page(),
                                            ));
                                        break;
                                      case 5:
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  catagory_Page(),
                                            ));
                                        break;
                                    }
                                  },
                                  child: Image.asset(
                                    transparentImages[index],
                                    fit: BoxFit.fill,
                                  ).box.shadow2xl.make(),
                                ),
                              ),
                              10.heightBox,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  catagoryLists[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.8,
                                  ),
                                ),
                              ).box.outerShadowLg.make()
                            ],
                          ),
                        )),
              ),
            ),
            30.heightBox,
            Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: "Popular Quotes"
                      .text
                      .bold
                      .letterSpacing(1.8)
                      .size(20)
                      .make()),
            ]).box.outerShadowXl.make(),
            Container(
              height: context.screenHeight / 2.1,
              child: ListView.builder(
                itemCount: perImages.length,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 15.5,
                  shadowColor: Colors.black,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        perImages[index],
                      ),
                    ),
                    title: Text(quotesName[index]),
                    subtitle: Text(
                      quotesPersons[index],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: drawer(),
    );
  }
}
