import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/core/theme/app_colors.dart';

/// Class used to view custom text form field
class CustomTextFormField extends StatefulWidget {
  /// Constructor used to create a new instance of the class
  const CustomTextFormField(
      {required this.label,
      this.onChanged,
      this.errorMessage = '',
      this.suffixIcon,
      this.obscureText = false,
      this.denySpaces = false,
      this.maxLines = 1,
      this.placeholder = '',
      this.initialValue = '',
      this.marginTop = 0,
      this.marginRight = 0,
      this.marginBottom = 0,
      this.marginLeft = 0,
      super.key});

  /// Method used to get the label
  final String label;

  /// Method used to get the onChanged
  final Function(String value)? onChanged;

  /// Method used to get the error message
  final String errorMessage;

  /// Method used to get the suffix icon
  final Widget? suffixIcon;

  /// Method used to get the obscure text
  final bool obscureText;

  /// Method used to get the deny spaces
  final bool denySpaces;

  /// Method used to get the max lines
  final int maxLines;

  /// Method used to get the placeholder
  final String placeholder;

  /// Method used to get the initial value
  final String? initialValue;

  /// Method used to get the margin left
  final double? marginLeft;

  /// Method used to get the margin right
  final double? marginRight;

  /// Method used to get the margin top
  final double? marginTop;

  /// Method used to get the margin bottom
  final double? marginBottom;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (widget.initialValue != null) {
          _controller.text = widget.initialValue!;
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
            left: widget.marginLeft!,
            right: widget.marginRight!,
            top: widget.marginTop!,
            bottom: widget.marginBottom!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: widget.maxLines == 1 ? 40 : null,
              child: TextFormField(
                controller: _controller,
                maxLines: widget.maxLines,
                inputFormatters: [
                  if (widget.denySpaces)
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                textInputAction: TextInputAction.done,
                obscureText: widget.obscureText,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText:
                      widget.placeholder.isNotEmpty ? widget.placeholder : null,
                  hintStyle: const TextStyle(fontSize: 12),
                  suffixIcon: widget.suffixIcon,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Theme.of(context).colorScheme.green.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Theme.of(context).colorScheme.green.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Theme.of(context).colorScheme.green.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (widget.errorMessage.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error,
                      size: 20, color: Theme.of(context).colorScheme.error),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      widget.errorMessage,
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                ],
              )
          ],
        ),
      );
}
