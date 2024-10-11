import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_pulse/controllers/tv_controller.dart';
import 'package:flick_pulse/screens/widgets/custom_circular_progress.dart';

class TvScreen extends StatelessWidget {
  final TVController _controller = Get.put(TVController());

  TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value && _controller.tvShowsList.isEmpty) {
          return const CustomCircularProgress();
        } else {
          return ListView.builder(
            itemCount: _controller.tvShowsList.length,
            itemBuilder: (context, index) {
              final tvShow = _controller.tvShowsList[index];
              return ListTile(
                leading: tvShow.posterPath.isNotEmpty
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w500${tvShow.posterPath}')
                    : null,
                title: Text(tvShow.name),
                subtitle: Text(tvShow.overview),
                onTap: () {},
              );
            },
          );
        }
      }),
    );
  }
}
