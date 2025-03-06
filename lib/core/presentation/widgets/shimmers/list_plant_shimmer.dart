import 'package:flutter/material.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

/// Shimmer effect for the list of plants
class ListPlantShimmer extends StatelessWidget {
  /// Constructor
  const ListPlantShimmer({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.beige,
          highlightColor: Theme.of(context).colorScheme.lightGray,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
