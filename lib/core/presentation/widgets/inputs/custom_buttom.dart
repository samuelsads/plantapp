import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Custom button widget
class CustomButtom extends StatelessWidget {
  //// Constructor used to create a new instance of the class
  const CustomButtom({
    required this.title,
    this.iconPath,
    this.textStyle,
    this.btnColor,
    required this.onPressed,
    this.marginTop = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    super.key,
  });

  /// Icon path
  final String? iconPath;

  /// Title
  final String title;

  /// Text color
  final TextStyle? textStyle;

  /// Button color
  final Color? btnColor;

  /// Method used to get the margin left
  final double? marginLeft;

  /// Method used to get the margin right
  final double? marginRight;

  /// Method used to get the margin top
  final double? marginTop;

  /// Method used to get the margin bottom
  final double? marginBottom;

  ///function used to onpressed buttom
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
            left: marginLeft!,
            right: marginRight!,
            top: marginTop!,
            bottom: marginBottom!),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all(btnColor),
              ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    iconPath!,
                    width: 20,
                    height: 20,
                  ),
                ),
              (title.isEmpty)
                  ? const SizedBox(
                      height: 40, width: 40, child: CircularProgressIndicator())
                  : Text(title,
                      style: (textStyle == null)
                          ? Theme.of(context).textTheme.labelLarge
                          : textStyle),
            ],
          ),
        ),
      );
}
