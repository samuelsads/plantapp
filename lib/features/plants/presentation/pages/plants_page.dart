import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/features/plants/presentation/pages/add_plant_page.dart';
import 'package:plant_app/features/plants/presentation/widgets/last_plants_widget.dart';
import 'package:plant_app/features/plants/presentation/widgets/list_plants_widget.dart';

/// [PlantsPage] is the page that displays the plants.
class PlantsPage extends StatefulWidget {
  /// [PlantsPage] is the page that displays the plants.
  const PlantsPage({super.key});

  /// [name] is the name of the page.
  static const name = 'plants-page';

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider.value(
          value: serviceLocator<PlantsBloc>()
            ..add(const GetPlantsEvent(limit: 10))
            ..add(const GetLastPlantsEvent(limit: 10)),
          child: const _MainBody(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async => await context.pushNamed(AddPlantPage.pathName),
        ),
      );
}

class _MainBody extends StatelessWidget {
  const _MainBody();

  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Column(
          children: [
            LastPlantsWidget(),
            ListPlantsWidget(),
          ],
        ),
      );
}
