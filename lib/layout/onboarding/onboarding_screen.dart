import 'package:clean_project/core/components/buttons/default_elevated_button.dart';
import 'package:clean_project/core/constants/colors/color.dart';
import 'package:clean_project/core/helpers/cache_helper/cache_helper.dart';
import 'package:clean_project/models/onboarding_model/onboarding_model.dart';
import 'package:clean_project/views/sign_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    var boardingControlller = PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  controller: boardingControlller,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == onBoardingList.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                        onBoardingList[index].image!,
                        width: 352.w,
                        height: 396.h,
                      )),
                      Text(onBoardingList[index].title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.sp,
                            color: AppColor.primaryColor,
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            onBoardingList[index].body!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: AppColor.primaryColor,
                                fontSize: 10.sp),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      SmoothPageIndicator(
                        controller: boardingControlller,
                        count: onBoardingList.length,
                        effect: ExpandingDotsEffect(
                            dotColor: AppColor.mainText,
                            activeDotColor: AppColor.primaryColor,
                            dotHeight: 6.h,
                            dotWidth: 6.w,
                            spacing: 5,
                            expansionFactor: 4),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 295.w,
                          height: 54.h,
                          child: DefaultElevatedButton(
                              name: index == 0 ? 'Get Started' : 'Next',
                              color: AppColor.mainText,
                              onPressed: () {
                                boardingControlller.nextPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              })),
                      TextButton(
                          onPressed: () {
                            CacheHelper.saveData(key: 'OnBoarding', value: true)
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                    (route) => false);
                              }
                            });
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColor.secondrycolor),
                          ))
                    ],
                  ),
                  itemCount: onBoardingList.length,
                )),
              ],
            )),
      ),
    );
  }
}
