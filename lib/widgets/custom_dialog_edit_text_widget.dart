import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDialogEditText extends StatelessWidget {
  const CustomDialogEditText({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.maxLegth,
    required this.textInputFormatter,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final int maxLegth;
  final TextInputFormatter textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[textInputFormatter],
      maxLength: maxLegth,
      controller: textEditingController,
      placeholder: hintText,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
