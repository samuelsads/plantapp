import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/core/presentation/widgets/shimmers/last_plants_shimmer.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

/// Widget for the last plants
class PlantsMoreExpensiveWidget extends StatelessWidget {
  /// Creates a new instance of the [PlantsMoreExpensiveWidget]
  const PlantsMoreExpensiveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocListener<PlantsBloc, PlantsState>(
        listenWhen: (previous, current) =>
            current.getLatestPlantsProgressStatus !=
            previous.getLatestPlantsProgressStatus,
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
            if (state.getLatestPlantsProgressStatus.isSuccess) {
              return _bodyLastPlants(context, state.latestPlants);
            }

            if (state.getLatestPlantsProgressStatus.isError) {
              return Text(state.verifyErrorMessage.toString());
            }

            return const LastPlantsShimmer();
          },
        ),
      );

  Widget _bodyLastPlants(BuildContext context, List<Plants> plants) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleLastPlants(context),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plants.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () async => context.push(
                        '/plant/${plants[index].id}',
                        extra: plants[index]),
                    child: _lastPlantItem(plants[index])),
              ),
            ),
          ],
        ),
      );

  Widget _titleLastPlants(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        child: Text(
          '10 plants more expensive',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      );

  Widget _lastPlantItem(Plants plant) => Container(
        margin: const EdgeInsets.all(10),
        width: 150,
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                plant.photoUrl,
                fit: BoxFit.fill,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox.expand(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                      child: Text(
                        plant.name,
                        style: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
}
