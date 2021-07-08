import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
import 'feed_dart.dart';
import 'home_screen.dart';
import 'message_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  final screen = [
    HomeScreen(),
    FeedScreen(),
    MessageScreen(),
    CartScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.blueAccent,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.rss_feed, size: 30),
          Icon(Icons.messenger, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
      ),
      body: screen[selectedIndex],
    );
  }
}
