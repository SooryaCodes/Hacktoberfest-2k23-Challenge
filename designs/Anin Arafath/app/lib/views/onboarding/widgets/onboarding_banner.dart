import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/onboarding_controller.dart';

class OnboardingBanner extends StatelessWidget {
  const OnboardingBanner({
    Key? key,
    required this.bgColor,
    required this.index,
  }) : super(key: key);

  final Color? bgColor;
  final int index;
  static final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 0,
          child: CircleAvatar(
            radius: 150,
            backgroundColor: bgColor,
          ),
        ),
        Image.asset(
          _onboardingController.onboardingList[index].imageURL!,
          width: AppSizes.onboardingImageSize,
        ),
      ],
    );
  }
}
