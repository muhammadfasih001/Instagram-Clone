import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:instagram_clone/controller/bottom_nav_controller.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final NavBottomController navBottomController =
      Get.put(NavBottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/instatext.png",
          height: 150,
          width: 150,
        ),
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(),
            showBadge: true,
            badgeContent: const Text(
              "10",
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(
              Icons.favorite_border_outlined,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(),
            showBadge: true,
            badgeContent: const Text(
              "15",
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(
              Icons.send,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 22,
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.grey.shade300,
          selectedItemColor: Colors.black,
          iconSize: 30,
          currentIndex: navBottomController.selectedIndex.value,
          onTap: (index) {
            navBottomController.navigateToPage(index);
          },
          elevation: 1,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: "Post",
              icon: Icon(
                Icons.add_box_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Reels",
              icon: Icon(
                Icons.video_collection_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_2_outlined,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: navBottomController.pageController,
        children: navBottomController.widgetOption,
        onPageChanged: (index) {
          navBottomController.pageChanged(index);
        },
      ),
    );
  }
}
