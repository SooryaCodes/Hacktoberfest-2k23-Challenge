import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/auth_service.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';
// import 'package:karmalab_assignment/services/shared_pref_service.dart';

class ForgotPasswordController extends GetxController with BaseController {
  final AuthService _authService = AuthService();

  // controllers
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _loading = false.obs;

  // ?? getters

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailController => _emailController;
  bool get loading => _loading.value;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailController.dispose();
    super.dispose();
  }

// validate login form
  bool validate() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    try {
      if (_nameTextController.text == "" || _emailController.text == "") {
        throw InvalidException("please fill all given inputs !!", false);
      } else {
        if (emailValid) {
          return true;
        } else {
          throw InvalidException("Email is not valid !!", false);
        }
      }
    } catch (e) {
      handleError(e);
      return false;
    }
  }

  Future<void> sendOtp(Function(bool)? success) async {
    final valid = validate();
    if (valid) {
      _loading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      // ? login method
      bool status = await _authService.sentOtp(
        {
          "email": _emailController.text.toString(),
        },
      );
      _loading.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      success!(status);
    }
  }
}
