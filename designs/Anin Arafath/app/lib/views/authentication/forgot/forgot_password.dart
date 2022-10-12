import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/forgot_password_controller.dart';
import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/verification/verification_view.dart';
// import 'package:karmalab_assignment/views/authentication/verification/verification_view.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';
import 'package:karmalab_assignment/widgets/fancy2_text.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({Key? key}) : super(key: key);
  static const routeName = '/forgot-password';
  static final ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              context.spacing(height: 10),
              Image.asset(
                AppImages.forgotImage,
                width: context.getWidth(65),
              ),
              const SizedBox(height: 25),
              const AuthHeader(
                title: "Forgot Password",
                subTitle: "Enter your email  address",
              ),
              const SizedBox(height: 30),
              CustomInputFelid(
                hint: "Business Name",
                controller: _forgotPasswordController.nameTextController,
                lowerMargin: true,
              ),
              CustomInputFelid(
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
                controller: _forgotPasswordController.emailController,
              ),
              Obx(() {
                return CustomButton(
                  label: "Sent OTP",
                  isLoading: _forgotPasswordController.loading,
                  onTap: () => _forgotPasswordController.sendOtp((bool status) {
                    if (status) {
                      Get.to(
                        VerificationView(
                          email: _forgotPasswordController.emailController.text,
                        ),
                      );
                    } else {
                      DialogHelper.showSnackBar();
                    }
                  }),
                );
              }),
              const SizedBox(height: 20),
              const Fancy2Text(
                first: "Didn’t received OPT? ",
                second: "Resent",
                isCenter: true,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
