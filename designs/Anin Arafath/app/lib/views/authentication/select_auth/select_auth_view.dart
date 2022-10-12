import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
import 'package:karmalab_assignment/views/authentication/siginup/signup_view.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';

class SelectAuthView extends StatelessWidget {
  const SelectAuthView({Key? key}) : super(key: key);
  static const routeName = "/selectAuth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          _banner(context),
          Positioned(
            bottom: 0,
            right: -80,
            left: -90,
            child: Container(
              height: context.getHeight(50),
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(300),
                  topLeft: Radius.circular(300),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.defaultPadding + 60,
                  right: AppSizes.defaultPadding + 60,
                  top: AppSizes.defaultPadding + 30,
                ),
                child: Column(
                  children: [
                    Text(
                      "Take A Step\nTowards Better Teaching",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: context.getWidth(6)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: context.getWidth(4.2)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 50),
                          CustomButton(
                              label: "Log In",
                              onTap: () => Navigator.pushNamed(
                                  context, LoginView.routeName)),
                          const SizedBox(height: 15),
                          CustomButton(
                            isFilled: false,
                            label: "Sign Up",
                            onTap: () => Navigator.pushNamed(
                              context,
                              SignUpView.routeName,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _banner(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.logLgBW,
          width: AppSizes.logoSize,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(bottom: context.getHeight(36)),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.authSelection,
              width: AppSizes.onboardingImageSize,
            ),
          ),
        ),
      ],
    );
  }
}
