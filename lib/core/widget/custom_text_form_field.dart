import 'dart:ui';

import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

typedef myValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  String label;

  myValidator validator;

  TextEditingController controller;

  TextInputType keyboard;

  bool obscure;

  Color color;

  String text;

  CustomTextFormField(
      {required this.label,
      required this.validator,
      required this.controller,
      required this.text,
      this.keyboard = TextInputType.text,
      this.color = Colors.white,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: TextStyle(color: ColorManager.white, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: color, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: color, width: 2)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: ColorManager.error, width: 2)),
                labelText: label,
                filled: true,
                labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: ColorManager.font)),
            validator: validator,
            controller: controller,
            keyboardType: keyboard,
            obscureText: obscure,
          ),
        ],
      ),
    );
  }
}
