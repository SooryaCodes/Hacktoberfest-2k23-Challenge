import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/color_constants.dart';
import 'package:karmalab_assignment/controllers/verify_otp_controller.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:pinput/pinput.dart';

class OtpFelid extends StatelessWidget {
  const OtpFelid({
    Key? key,
  }) : super(key: key);

  static final VerifyOtpController _verifyOtpController =
      Get.put(VerifyOtpController());

  static final defaultTheme = PinTheme(
    width: 70,
    height: 85,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: AppColors.orange.withOpacity(.1),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: (pin) {
        // print("oncomplete");
        _verifyOtpController.onChange(pin);
      },
      onChanged: ((value) {
        _verifyOtpController.onChange(value);
      }),
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
      focusedPinTheme: defaultTheme.copyDecorationWith(
        border: Border.all(color: AppColors.darkOrange, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      defaultPinTheme: defaultTheme.copyWith(
        width: context.getWidth(17),
        height: context.getHeight(10),
      ),
    );
  }
}
