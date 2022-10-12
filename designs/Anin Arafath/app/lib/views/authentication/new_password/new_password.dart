import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:karmalab_assignment/constants/image_constants.dart';
import 'package:karmalab_assignment/constants/size_constants.dart';
import 'package:karmalab_assignment/controllers/reset_password_controller.dart';
import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/utils/dimension.dart';
import 'package:karmalab_assignment/views/authentication/login/login_view.dart';
import 'package:karmalab_assignment/views/authentication/widget/auth_header.dart';
import 'package:karmalab_assignment/widgets/custom_button.dart';
import 'package:karmalab_assignment/widgets/custom_input.dart';

class NewPassWordView extends StatefulWidget {
  const NewPassWordView({Key? key, this.email}) : super(key: key);
  static const routeName = "/newPassword";
  final String? email;

  @override
  State<NewPassWordView> createState() => _NewPassWordViewState();
}

class _NewPassWordViewState extends State<NewPassWordView> {
  bool isSecure = false;
  final ResetPassWordController _resetPassWordController =
      Get.put(ResetPassWordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              context.spacing(height: 10),
              Image.asset(
                AppImages.newPass,
                width: context.getWidth(65),
              ),
              const SizedBox(height: 50),
              const AuthHeader(
                title: "New Password",
                subTitle: "Enter new password",
              ),
              const SizedBox(height: 40),
              CustomInputFelid(
                hint: "New password",
                lowerMargin: true,
                controller: _resetPassWordController.passwordController,
              ),
              CustomInputFelid(
                hint: "Conform password",
                keyboardType: TextInputType.emailAddress,
                isPassWord: true,
                secure: isSecure,
                controller: _resetPassWordController.conformPasswordController,
                toggle: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              Obx(() {
                return CustomButton(
                  label: "Submit",
                  isLoading: _resetPassWordController.loading,
                  onTap: () => _resetPassWordController
                      .resetPassword(widget.email, (status) {
                    if (status) {
                      Get.toNamed(LoginView.routeName);
                      DialogHelper.showSnackBar(
                          title: "Done 😎",
                          description: "password successfully changed");
                    } else {
                      DialogHelper.showSnackBar();
                    }
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
