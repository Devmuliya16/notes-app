import 'package:flutter/material.dart';

class getInputOutlined extends StatelessWidget {
  const getInputOutlined({
    super.key,
    required this.controller,
    required this.labeltext,
    this.maxLen = 255,
    this.maxL = 2,
    this.minL = 1,
  });

  final TextEditingController controller;
  final radius = 5.0;
  final String labeltext;
  final int? maxLen;
  final int? minL;
  final int? maxL;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: this.maxLen,
      minLines: this.minL,
      maxLines: this.maxL,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(this.radius)),
          labelText: this.labeltext),
    );
  }
}
