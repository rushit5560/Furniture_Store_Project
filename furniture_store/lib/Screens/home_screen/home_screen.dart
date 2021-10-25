import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_drawer/custom_drawer_screen.dart';
import 'package:furniture_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:furniture_store/widgets/home_screen_widgets/home_screen_widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // const HomeView({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule(),

      drawer: CustomDrawerScreen(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderModule(homeScreenController: homeScreenController),
            const SizedBox(height: 10),
            SearchTextFieldModule(searchFieldController: searchFieldController),
            const SizedBox(height: 15),
            CategoryModule(homeScreenController: homeScreenController),
            const SizedBox(height: 15),
            TrendingModule(homeScreenController: homeScreenController),
            const SizedBox(height: 15),
            NewArrivalModule(homeScreenController: homeScreenController),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }


}
