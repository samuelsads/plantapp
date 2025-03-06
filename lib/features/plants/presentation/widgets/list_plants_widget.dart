import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/presentation/widgets/shimmers/list_plant_shimmer.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

/// Widget used to display a list of plants
class ListPlantsWidget extends StatelessWidget {
  /// Creates a new [ListPlantsWidget] instance
  const ListPlantsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocListener<PlantsBloc, PlantsState>(
        listenWhen: (previous, current) =>
            previous.getPlantsProgressStatus != current.getPlantsProgressStatus,
        listener: (context, state) {
          if (state.getPlantsProgressStatus.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.verifyErrorMessage ?? ''),
              ),
            );
          }
        },
        child: BlocBuilder<PlantsBloc, PlantsState>(
          builder: (context, state) {
            if (state.getPlantsProgressStatus.isSuccess) {
              if (state.plants.isEmpty) {
                return const Center(
                  child: Text('No plants yet'),
                );
              }
              return _plantsList(state.plants);
            }

            if (state.getPlantsProgressStatus.isError) {
              return Center(
                child: Text(state.verifyErrorMessage ?? ''),
              );
            }

            return const ListPlantShimmer();
          },
        ),
      );

  Widget _plantsList(List<Plants> plants) => Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      plants[index].photoUrl,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plants[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 20)),
                        Text(
                          plants[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
