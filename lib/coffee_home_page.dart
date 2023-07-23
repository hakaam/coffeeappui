import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tabs/cappucino_tab.dart';

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 5, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'daja',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Color.fromRGBO(107, 92, 93, 1)),
                            ),
                            Text(
                              'Brew',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color.fromRGBO(239, 227, 200, 1)),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.orange,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Color.fromRGBO(243, 202, 145, 1),
                            child: Image.asset('images/profile.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromRGBO(23, 16, 23, 1),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromRGBO(239, 227, 200, 1),
                          ),
                          hintText: 'Browse your favorite coffee...',
                          hintStyle:
                          TextStyle(color: Color.fromRGBO(107, 92, 93, 1)),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    child: Row(children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(56, 35, 42, 1),
                              borderRadius:
                              BorderRadius.only(bottomRight: Radius.circular(50))),
                          child: TabBar(
                            controller: controller,
                            indicatorColor: Colors.transparent,
                            labelColor: Color.fromRGBO(239, 227, 200, 1),
                            unselectedLabelColor: Color.fromRGBO(158, 158, 158, 0.5),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            labelPadding: EdgeInsets.zero,
                            tabs: [
                              'Cappuccino',
                              'Flat White ',
                              'Espresson',
                              'Americano',
                              'Latte'
                            ]
                                .map((e) => Text(
                              e,
                              style: TextStyle(fontSize: 15),
                            ))
                                .toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TabBarView(
                            controller: controller,
                            children: [
                              CappuccinoTab(),
                              Center(
                                child: Text(
                                  'Flat',
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Espresson',
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Americon',
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Latte',
                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ))
            ],
          )),
    );
  }
}