import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? requiredName;
  final int? maxLines;
  final String hintText;
  const MyTextField({super.key,required this.controller,   this.requiredName, required this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black,width: 1
        ),
      ),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return requiredName;
          }
        },
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.only(left: 10),
          hintText: hintText,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
