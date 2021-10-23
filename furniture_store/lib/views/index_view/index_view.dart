import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/views/home_view/home_view.dart';
import 'package:furniture_store/views/notification_view/notification_view.dart';
import 'package:furniture_store/views/profile_view/profile_view.dart';
import 'package:furniture_store/views/search_view/search_view.dart';
import 'package:furniture_store/views/wishlist_view/wishlist_view.dart';

class IndexView extends StatefulWidget {
  // const IndexView({Key? key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  int _currentIndex = 0;

  final tabs = [
    HomeView(),
    WishlistView(),
    SearchView(),
    NotificationView(),
    ProfileView(),
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
