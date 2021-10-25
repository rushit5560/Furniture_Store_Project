import 'package:flutter/material.dart';
import 'package:furniture_store/Screens/home_screen/home_screen.dart';
import 'package:furniture_store/Screens/notification_screen/notification_screen.dart';
import 'package:furniture_store/Screens/profile_screen/profile_screen.dart';
import 'package:furniture_store/Screens/search_screen/search_screen.dart';
import 'package:furniture_store/Screens/wishlist_screen/wishlist_screen.dart';
import 'package:furniture_store/common/custom_color.dart';

class IndexScreen extends StatefulWidget {
  // const IndexView({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    WishlistScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_currentIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: CustomColor.kLightGreenColor, width: 2),
              left: BorderSide(color: CustomColor.kLightGreenColor, width: 2),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),

    );
  }
}
