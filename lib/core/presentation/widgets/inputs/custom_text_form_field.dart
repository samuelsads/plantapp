import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom text field with a label above and optional error message below.
class CustomTextFormField extends StatefulWidget {
  /// Creates an instance of [CustomTextFormField]
  const CustomTextFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.errorMessage = '',
    this.suffixIcon,
    this.obscureText = false,
    this.denySpaces = false,
    this.maxLines = 1,
    this.placeholder = '',
    this.initialValue = '',
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
  });

  /// The label displayed above the text field.
  final String label;

  /// A callback function to be called when the text field's value changes.
  final Function(String value)? onChanged;

  /// An optional error message to be displayed below the text field.
  final String errorMessage;

  /// An optional icon to be displayed at the end of the text field.
  final Widget? suffixIcon;

  /// Whether the text field should obscure the text input.
  final bool obscureText;

  /// Whether the text field should deny spaces.
  final bool denySpaces;

  /// The maximum number of lines for the text field.
  final int maxLines;

  /// The placeholder text for the text field.
  final String placeholder;

  /// The initial value for the text field.
  final String? initialValue;

  /// The margin for the text field.

  final double marginLeft;

  /// The margin for the text field.
  final double marginRight;

  /// The margin for the text field.
  final double marginTop;

  /// The margin for the text field.
  final double marginBottom;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });
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
            left: widget.marginLeft,
            right: widget.marginRight,
            top: widget.marginTop,
            bottom: widget.marginBottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(color: Colors.grey),
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
                  suffixIcon: widget.suffixIcon,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Colors.grey.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Colors.grey.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: widget.errorMessage.isEmpty
                          ? Colors.grey.withOpacity(0.6)
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            if (widget.placeholder.isNotEmpty && widget.errorMessage.isEmpty)
              Text(
                widget.placeholder,
                style: TextStyle(color: Colors.grey.withOpacity(0.8)),
              ),
            if (widget.errorMessage.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.error,
                      size: 20, color: Theme.of(context).colorScheme.error),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(widget.errorMessage,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error)),
                  ),
                ],
              )
          ],
        ),
      );
}
