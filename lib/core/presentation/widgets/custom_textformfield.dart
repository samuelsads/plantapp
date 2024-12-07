import 'package:flutter/material.dart';


class CustomtextFormField extends StatefulWidget {
   const CustomtextFormField({this.left=24, this.right=24, this.top= 24, this.bottom=0,this.placeholder, this.isPassword= false,required  this.title,required  this.controller,super.key});
  final String title;
  final TextEditingController controller;
  final bool? isPassword;
  final String ? placeholder;
  final double? left;
  final double? right;
  final double?top;
  final double? bottom;
  @override
  State<CustomtextFormField> createState() => _CustomtextFormFieldState();
}

class _CustomtextFormFieldState extends State<CustomtextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin:  EdgeInsets.only(left: widget.left!,right: widget.right!, top: widget.top!, bottom: widget.bottom!),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                 TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword??false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: widget.placeholder,
                    hintStyle: const TextStyle( fontSize: 14),
               
                  ),
                 ),
               ],
             ),
           );
  }
}