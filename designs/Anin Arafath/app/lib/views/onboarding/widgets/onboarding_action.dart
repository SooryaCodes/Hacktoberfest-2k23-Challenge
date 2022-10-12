import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/onboarding_controller.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';
import 'package:karmalab_assignment/widgets/custom_animated_button.dart';

class OnboardingAction extends StatelessWidget {
  const OnboardingAction({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  static final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    var selectedIndex = _onboardingController.selectedIndex;

    var color = _onboardingController.onboardingList[selectedIndex].bgColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: List.generate(
                itemCount,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(
                        milliseconds: AppSizes.defaultAnimationDuration),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: selectedIndex == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? AppColors.dark
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedButton(
            selectedIndex: selectedIndex,
            color: color,
            length: _onboardingController.onboardingList.length,
            onTap: () {
              if (_onboardingController.selectedIndex ==
                  _onboardingController.onboardingList.length - 1) {
                Navigator.pushNamed(context, SelectAuthView.routeName);
              } else {
                _onboardingController.next();
              }
            },
          )
        ],
      ),
    );
  }
}
