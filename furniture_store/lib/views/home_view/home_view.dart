import 'package:flutter/material.dart';
import 'package:furniture_store/common/custom_color.dart';
import 'package:furniture_store/common/custom_drawer/custom_drawer_view.dart';
import 'package:furniture_store/controllers/home_view_controller/home_view_controller.dart';
import 'package:furniture_store/widgets/home_view_widgets/home_view_widgets.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  // const HomeView({Key? key}) : super(key: key);

  HomeViewController homeViewController = Get.put(HomeViewController());
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarModule(),

      drawer: CustomDrawerView(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderModule(homeViewController: homeViewController),
            const SizedBox(height: 10),
            SearchTextFieldModule(searchFieldController: searchFieldController),
            const SizedBox(height: 15),
            CategoryModule(homeViewController: homeViewController),
            const SizedBox(height: 15),
            TrendingModule(homeViewController: homeViewController),
            const SizedBox(height: 15),
            NewArrivalModule(homeViewController: homeViewController),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }


}
