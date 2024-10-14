import 'package:get/get.dart';
import 'movies_controller.dart';
import 'tv_controller.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      final MoviesController moviesController = Get.find<MoviesController>();
      moviesController.scrollController.jumpTo(0);
    } else if (index == 1) {
      final TvController tvController = Get.find<TvController>();
      tvController.scrollController.jumpTo(0);
    }
  }
}
