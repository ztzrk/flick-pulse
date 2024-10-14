import 'package:flutter/material.dart';
import 'package:flick_pulse/screens/widgets/custom_card.dart';
import 'package:flick_pulse/screens/widgets/shimmer_card.dart';

class CustomGrid<T> extends StatelessWidget {
  final ScrollController scrollController;
  final List<T> itemList;
  final bool isLoading;
  final String Function(T) getPosterPath;

  const CustomGrid({
    super.key,
    required this.scrollController,
    required this.itemList,
    required this.isLoading,
    required this.getPosterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey<String>('customGrid'),
      controller: scrollController,
      padding: const EdgeInsets.only(top: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.67,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
      itemCount: itemList.length + (isLoading ? 6 : 0),
      itemBuilder: (context, index) {
        if (index < itemList.length) {
          final item = itemList[index];
          return CustomCard<T>(
            item: item,
            getPosterPath: getPosterPath,
          );
        } else {
          return const ShimmerCard();
        }
      },
    );
  }
}
