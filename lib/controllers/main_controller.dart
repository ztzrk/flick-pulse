import 'package:flick_pulse/controllers/movies_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void _onScroll() {
    final moviesController = Get.find<MoviesController>();
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      moviesController.fetchMovies(isLoadMore: true);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
