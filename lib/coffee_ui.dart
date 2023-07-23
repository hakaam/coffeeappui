import 'package:flutter/material.dart';
import 'package:tastiappui/cappucinno_list.dart';
import 'package:tastiappui/coffee_cart.dart';

import 'Tabs/cappucino_tab.dart';
import 'coffee_home_page.dart';
import 'details_screen.dart';

class CoffeeUi extends StatefulWidget {
  const CoffeeUi({super.key});

  @override
  State<CoffeeUi> createState() => _CoffeeUiState();
}

class _CoffeeUiState extends State<CoffeeUi> {
  int currentIndex = 0;
  getWidgets(index) {
    switch (index) {
      case 0:
        return CoffeeHomePage();
      case 1:
        return CoffeeCart();

      case 2:
        return Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        );

      case 3:
        return Center(
          child: Text(
            'Notification',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 21, 32, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(32, 21, 32, 1),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(239, 227, 200, 1),
        unselectedItemColor: Color.fromRGBO(107, 92, 93, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: getWidgets(currentIndex),
    );
  }
}



