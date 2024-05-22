import 'package:clean_project/core/constants/colors/color.dart';
import 'package:flutter/material.dart';

IconButton backButton(context) => IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(
      Icons.arrow_left_outlined,
      size: 30,
      color: AppColor.mainText,
    ));
