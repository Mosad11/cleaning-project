import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clean_project/core/constants/colors/color.dart';
import 'package:clean_project/core/constants/strings/strings.dart';
import 'package:clean_project/layout/main_layout/main_layout.dart';
import 'package:clean_project/layout/onboarding/onboarding_screen.dart';
import 'package:clean_project/views/sign_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash2.png",
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Clean Co",
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20.sp,
                fontFamily: 'Poppins'),
          ),
        ],
      ),
      nextScreen: isOnBoarding != null
          ? token != null
              ? const MainLayout()
              : const LoginScreen()
          : const OnBoardingScreen(),
      splashIconSize: 600,
      duration: 1500,
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
