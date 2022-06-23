import 'package:flutter/material.dart';

import '../constants/common_size.dart';

InputDecoration buildInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      enabledBorder: buildActiveInputBorder(),
      focusedBorder: buildActiveInputBorder(),
      errorBorder: buildErrorInputBorder(),
      focusedErrorBorder: buildErrorInputBorder(),
      filled: true,
      fillColor: Colors.grey[100]);
}

OutlineInputBorder buildErrorInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
    ),
    borderRadius: BorderRadius.circular(common_s_gap),
  );
}

OutlineInputBorder buildActiveInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[300]!,
    ),
    borderRadius: BorderRadius.circular(common_s_gap),
  );
}
