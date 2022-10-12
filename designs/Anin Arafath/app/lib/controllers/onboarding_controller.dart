import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/models/onboarding_model.dart';

class OnboardingController extends GetxController {
  final _selectedIndex = 0.obs;
  late AnimationController _animationController;
  final PageController _pageController = PageController();

  final List<OnboardingModel> _onboardingList = [
    OnboardingModel(
      title: "Learn from Experts and Professionals",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
      imageURL: "assets/images/png/onboarding-images/onboarding-3.png",
      bgColor: const Color(0xffEBF4FF),
    ),
    OnboardingModel(
      title: "One to one doubt clearing sessions!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. ",
      imageURL: "assets/images/png/onboarding-images/onboarding-1.png",
      bgColor: const Color(0xffFFDDDD),
    ),
    OnboardingModel(
      title: "Explore your new skills everyday!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
      imageURL: "assets/images/png/onboarding-images/onboarding-2.png",
      bgColor: const Color(0xffE6FFD6),
    ),
  ];

  //getters
  List<OnboardingModel> get onboardingList => _onboardingList;
  int get selectedIndex => _selectedIndex.value;
  AnimationController get animationController => _animationController;
  PageController get pageController => _pageController;
  //setters
  set setAnimationController(AnimationController controller) =>
      _animationController = controller;

  void onPageChanged(int index) {
    _selectedIndex.value = index;
    if (index == onboardingList.length - 1) {
      // if (_animationController.isCompleted) {

      //   _animationController.reset();
      //   // _animationController.forward();
      //   // _animationController.reverse();
      // }
      _animationController.reset();
      _animationController.forward();
    }
  }

  void next() {
    _pageController.animateToPage(_selectedIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutQuint);
  }
}
