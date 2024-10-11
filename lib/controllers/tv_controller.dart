import 'package:flick_pulse/models/tv_model.dart';
import 'package:flick_pulse/services/tv_service.dart';
import 'package:get/get.dart';

class TVController extends GetxController {
  var isLoading = false.obs;
  var tvShowsList = <Tv>[].obs;
  var currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    fetchTVShows();
  }

  void fetchTVShows({bool isLoadMore = false}) async {
    if (isLoading.value) return;

    isLoading.value = true;

    if (!isLoadMore) {
      currentPage = 1;
      tvShowsList.clear();
    } else {
      currentPage++;
    }

    List<Tv> tvShows = await TvService.fetchPopularTVShows(page: currentPage);

    tvShowsList.addAll(tvShows);
    isLoading.value = false;
  }
}
