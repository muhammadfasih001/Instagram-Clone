import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Screen/add%20post/add_post_screen.dart';
import 'package:instagram_clone/Screen/feed/feed_screen.dart';
import 'package:instagram_clone/Screen/profile/profile_screen.dart';
import 'package:instagram_clone/Screen/reel/reel_screen.dart';
import 'package:instagram_clone/Screen/search/search_screen.dart';

class NavBottomController extends GetxController {
  final RxList<Widget> widgetOption = [
    const FeedScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    const ReelScreen(),
    const ProfileScreen()
  ].obs;

  RxInt selectedIndex = 0.obs;

  final PageController pageController = PageController();

  navigateToPage(index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  pageChanged(index) {
    selectedIndex.value = index;
  }
}
