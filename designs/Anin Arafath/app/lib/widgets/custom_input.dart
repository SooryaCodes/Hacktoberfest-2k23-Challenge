import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';

class CustomInputFelid extends StatelessWidget {
  const CustomInputFelid({
    Key? key,
    this.hint,
    this.isPassWord = false,
    this.secure = false,
    this.toggle,
    this.keyboardType = TextInputType.text,
    this.lowerMargin = false,
    this.controller,
  }) : super(key: key);
  final String? hint;
  final TextInputType? keyboardType;
  final bool? isPassWord;
  final bool? secure;
  final Function()? toggle;
  final bool? lowerMargin;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      margin: EdgeInsets.only(bottom: lowerMargin! ? 18 : 35),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.orange.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: secure!,
          keyboardType: keyboardType,
          cursorColor: AppColors.darkOrange,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
            hintText: "$hint",
            hintStyle: GoogleFonts.openSans(color: AppColors.darkOrange),
            suffixIcon: isPassWord!
                ? GestureDetector(
                    onTap: toggle,
                    child: Icon(
                      secure!
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.darkOrange,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
