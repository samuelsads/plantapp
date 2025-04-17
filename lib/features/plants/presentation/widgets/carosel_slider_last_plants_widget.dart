import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/presentation/widgets/shimmers/last_plants_shimmer.dart';
import 'package:plant_app/core/theme/app_colors.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

/// Widget used to display a carousel of plants
class CarouselSliderLastPlantsWidget extends StatelessWidget {
  /// Creates a new instance of the carousel slider widget
  const CarouselSliderLastPlantsWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<PlantsBloc, PlantsState>(
        builder: (context, state) {
          if (state.getLatestPlantsProgressStatus.isError) {
            return Text(state.verifyErrorMessage.toString());
          }

          if (state.getLatestPlantsProgressStatus.isLoading) {
            return const LastPlantsShimmer();
          }

          if (state.getLatestPlantsProgressStatus.isSuccess) {
            final plants = state.latestPlants;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text('Last 5 plants',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                  ),
                  items: plants
                      .map((plant) => _plantItem(plant, context))
                      .toList(),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      );

  Widget _plantItem(Plants plant, BuildContext context) => Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                plant.photoUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 180,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black.withValues(alpha: 0.7),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Center(
                  child: Text(
                    plant.name,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.white,
                          fontSize: 18,
                        ),
                  ),
                )),
          )
        ],
      );
}
