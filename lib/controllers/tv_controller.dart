import 'package:flick_pulse/models/tv_model.dart';
import 'package:flick_pulse/services/tv_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum TvCategory { popular, topRated, airingToday }

class TvController extends GetxController {
  var isLoading = false.obs;
  var tvShowsList = <Tv>[].obs;
  var selectedCategory = TvCategory.popular.obs;
  var currentPage = 1;
  var hasMorePages = true.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    fetchTvShows();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isLoading.value &&
        hasMorePages.value) {
      fetchTvShows(isLoadMore: true);
    }
  }

  Future<void> fetchTvShows({bool isLoadMore = false}) async {
    if (isLoading.value || (!isLoadMore && !hasMorePages.value)) return;

    isLoading.value = true;

    if (!isLoadMore) {
      currentPage = 1;
      hasMorePages.value = true;
      tvShowsList.clear();
    } else {
      currentPage++;
    }

    List<Tv> tvShows = [];

    switch (selectedCategory.value) {
      case TvCategory.popular:
        tvShows = await TvService.fetchPopularTVShows(page: currentPage);
        break;
      case TvCategory.topRated:
        tvShows = await TvService.fetchTopRatedTVShows(page: currentPage);
        break;
      case TvCategory.airingToday:
        tvShows = await TvService.fetchAiringTodayTVShows(page: currentPage);
        break;
    }

    if (tvShows.isEmpty) {
      hasMorePages.value = false;
    }

    if (isLoadMore) {
      tvShowsList.addAll(tvShows);
    } else {
      tvShowsList.value = tvShows;
    }

    isLoading.value = false;
  }

  void changeCategory(TvCategory category) {
    if (selectedCategory.value != category) {
      selectedCategory.value = category;

      if (scrollController.hasClients) {
        scrollController.jumpTo(0);
      }

      tvShowsList.clear();
      fetchTvShows();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
