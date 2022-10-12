import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';

class Fancy2Text extends StatelessWidget {
  const Fancy2Text({
    Key? key,
    this.first,
    this.second,
    this.isCenter = false,
    this.onTap,
  }) : super(key: key);
  final String? first;
  final String? second;
  final bool? isCenter;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter! ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          first ?? "",
          style: GoogleFonts.openSans(),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            second ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.darkOrange,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
