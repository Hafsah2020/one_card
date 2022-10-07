import 'package:flutter/material.dart';
import '../constants_and_components.dart';
import 'screens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.name});
  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int pageIndex = 0; //set the first page to load when the app is initiated

  Widget build(BuildContext context) {
    List screens = [Cards(), NewCard(),settings(context)];
    List appBars = [
      appBar(false, context, 'Hi ${widget.name}'),
      appBar(false, context, 'Hi ${widget.name}'),
      settingsAppBar(context)
    ];
    return Scaffold(
        appBar: appBars[pageIndex],
        body: screens[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          selectedItemColor: color,
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined), label: 'cards'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'settings')
          ],
        ),
        floatingActionButton: pageIndex == 1
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => NewCard()));
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.add, color: color),
              )
            : null);
  }
}
