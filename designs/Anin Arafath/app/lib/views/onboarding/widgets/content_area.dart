import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/models/onboarding_model.dart';

Padding contentArea(OnboardingModel item, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item.title!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Text(item.description!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium),
      ],
    ),
  );
}
