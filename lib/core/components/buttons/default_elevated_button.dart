import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton(
      {Key? key,
      required this.name,
      required this.color,
      required this.onPressed})
      : super(key: key);
  String name;
  Color color;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      height: 54.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ))),
        onPressed: onPressed,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Rubik',
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
