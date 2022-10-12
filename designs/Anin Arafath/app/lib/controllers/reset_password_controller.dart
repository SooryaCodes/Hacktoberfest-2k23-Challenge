import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/auth_service.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class ResetPassWordController extends GetxController with BaseController {
  final AuthService _authService = AuthService();

  // controllers
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();
  final _loading = false.obs;

  TextEditingController get passwordController => _passwordController;
  TextEditingController get conformPasswordController =>
      _conformPasswordController;
  bool get loading => _loading.value;

  bool validate() {
    try {
      if (_passwordController.text == "" ||
          _conformPasswordController.text == "") {
        throw InvalidException("please fill all given inputs !!", false);
      } else {
        if (_passwordController.text.length >= 8) {
          if (_passwordController.text == _conformPasswordController.text) {
            return true;
          } else {
            throw InvalidException("conform your password !!", false);
          }
        } else {
          throw InvalidException("password must be greater than 8 !!", false);
        }
      }
    } catch (e) {
      handleError(e);
      return false;
      // rethrow;
    }
  }

  Future<void> resetPassword(String? email, Function(bool)? success) async {
    final valid = validate();
    if (valid) {
      _loading.value = true;
      await Future.delayed(const Duration(seconds: 2));

// ? register method
      bool status = await _authService.resetPassword(
        {
          "email": email,
          "password": _passwordController.text.toString(),
        },
      );
      _loading.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      success!(status);
    }
  }
}
