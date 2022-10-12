import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key, this.subTitle, this.title}) : super(key: key);
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$title", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          "$subTitle",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
