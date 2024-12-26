import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:plant_app/core/presentation/widgets/inputs/single_image_input.dart';

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
      body: Container(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: const Column(
          children: [
            CustomTextFormField(label: 'Name'),
            CustomTextFormField(label: 'Seller'),
            CustomTextFormField(label: 'Price'),
            SingleImageInput(label: 'Image'),
          ],
        ),
      ));
}
