import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_buttom.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:plant_app/core/presentation/widgets/inputs/single_image_input.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/features/plants/presentation/cubits/add_plant/add_plant_cubit.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';
import 'package:plant_app/utils/extensions/build_context_extension.dart';

/// [AddPlantPage] is the page that displays the plants.
class AddPlantPage extends StatefulWidget {
  /// [AddPlantPage] is the page that displays the plants.
  const AddPlantPage({super.key});

  /// [path] is the name of the page.
  static const path = '/add-plant-page';

  /// [pathName] is the path of the page.
  static const pathName = '/add-plant-page';

  @override
  State<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Add Plant'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: serviceLocator<AddPlantCubit>(),
          ),
          BlocProvider.value(
            value: serviceLocator<PlantsBloc>(),
          ),
        ],
        child: BlocListener<PlantsBloc, PlantsState>(
          listener: (context, state) {
            if (state.savePlantProgressStatus.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.verifyErrorMessage ?? ''),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }

            if (state.savePlantProgressStatus.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Plant added successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<PlantsBloc, PlantsState>(
            builder: (context, state) =>
                BlocBuilder<AddPlantCubit, AddPlantState>(
              builder: (context, cubitState) => SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        label: context.localizations.name,
                        onChanged: (value) =>
                            context.read<AddPlantCubit>().onName(value),
                      ),
                      CustomTextFormField(
                        label: context.localizations.seller,
                        onChanged: (value) =>
                            context.read<AddPlantCubit>().onSeller(value),
                      ),
                      CustomTextFormField(
                        label: context.localizations.price,
                        onChanged: (value) =>
                            context.read<AddPlantCubit>().onPrice(value),
                      ),
                      SingleImageInput(
                        label: context.localizations.image,
                        onImageChanged: (file) =>
                            context.read<AddPlantCubit>().onImage(file),
                      ),
                      CustomTextFormField(
                        marginTop: 12,
                        label: context.localizations.description,
                        maxLines: 4,
                        onChanged: (value) =>
                            context.read<AddPlantCubit>().onDescription(value),
                      ),
                      CustomButtom(
                          title: state.savePlantProgressStatus.isLoading
                              ? ''
                              : 'Guardar',
                          marginTop: 12,
                          onPressed: state.savePlantProgressStatus.isLoading
                              ? () {}
                              : () {
                                  final PlantRequest request = PlantRequest(
                                    name: cubitState.name,
                                    arrivalDate: DateTime.now(),
                                    description: cubitState.description,
                                    photo: cubitState.image!,
                                    price: cubitState.price,
                                    sellerName: cubitState.seller,
                                    update: [],
                                    photoUrl: '',
                                  );
                                  context.read<PlantsBloc>().add(SavePlantEvent(
                                        request: request,
                                      ));
                                })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
}
