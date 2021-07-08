import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
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
  int currentPage = 0;
  LiquidController? _liquidController;

  int selectedIndex = 0;
  final screen = [
    HomeScreen(),
    FeedScreen(),
    MessageScreen(),
    CartScreen(),
    AccountScreen()
  ];

  @override
  void initState() {
    _liquidController = LiquidController();
    // TODO: implement initState

    super.initState();
  }

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
            _liquidController!.animateToPage(page: index, duration: 600);

            print('nab click: ${_liquidController!.currentPage}');
          });
        },

        animationCurve: Curves
            .easeInBack, //! this animationCurve is the atyle of navigation bar
      ),
      ////body: screen[selectedIndex], //? this is only for view CarvedNavigationBar
      body: Builder(
        //! liquid Swiper
        builder: (context) => LiquidSwipe(
          liquidController: _liquidController,
          pages: screen,
          initialPage: selectedIndex,
          waveType: WaveType.liquidReveal, //? tow types circulatr and liquid
          onPageChangeCallback: (page) => pageChangeCallback(page),
          // currentUpdateTypeCallback: (updateType) =>
          //     updateTypeCallback(updateType),
        ),
      ),
    );
  }

  pageChangeCallback(int page) {
    print('swiple click: ${page}');
    setState(() {
      selectedIndex = page;
    });
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}
