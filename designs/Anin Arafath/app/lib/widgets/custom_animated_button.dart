import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/controllers/onboarding_controller.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.selectedIndex,
    required this.color,
    this.length,
    this.onTap,
  }) : super(key: key);

  final int selectedIndex;
  final Color? color;
  final int? length;
  final Function()? onTap;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  // late AnimationController _animationController;
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());
  late Animation<double> animation;
  @override
  void initState() {
    _onboardingController.setAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    animation = CurvedAnimation(
        parent: _onboardingController.animationController,
        curve: Curves.easeInOut);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        curve: Curves.easeInCubic,
        duration: const Duration(milliseconds: 200),
        width: widget.selectedIndex == widget.length! - 1 ? 160 : 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(
              widget.selectedIndex == widget.length! - 1 ? 15 : 30),
        ),
        child: widget.selectedIndex == widget.length! - 1
            ? Opacity(
                opacity: animation.value,
                child: Center(
                  child: SizeTransition(
                    axisAlignment: 5,
                    axis: Axis.horizontal,
                    sizeFactor: animation,
                    child: Center(
                      child: Text(
                        "Get Started",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: widget.color),
                      ),
                    ),
                  ),
                ),
              )
            : Icon(
                Icons.arrow_forward_rounded,
                size: 35,
                color: widget.color,
              ),
      ),
    );
  }
}
