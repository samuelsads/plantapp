import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// Shimmer effect for the last plants
class LastPlantsShimmer extends StatelessWidget {
  /// Creates a new instance of the LastPlantsShimmer class
  const LastPlantsShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.beige,
        highlightColor: Theme.of(context).colorScheme.lightGray,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(context),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => _lastPlantItem(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _title(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          height: 20,
          width: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.beige,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  Widget _lastPlantItem() => Container(
        margin: const EdgeInsets.all(10),
        width: 150,
        height: 150,
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
}
