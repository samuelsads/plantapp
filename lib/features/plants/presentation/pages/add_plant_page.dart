import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_buttom.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:plant_app/core/presentation/widgets/inputs/single_image_input.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: [
              CustomTextFormField(label: context.localizations.name),
              CustomTextFormField(label: context.localizations.seller),
              CustomTextFormField(label: context.localizations.price),
              SingleImageInput(label: context.localizations.image),
              CustomTextFormField(
                marginTop: 12,
                label: context.localizations.description,
                maxLines: 4,
              ),
              CustomButtom(title: 'Guardar', marginTop: 12, onPressed: () {})
            ],
          ),
        ),
      ));
}
