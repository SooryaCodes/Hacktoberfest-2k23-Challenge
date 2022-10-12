import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/auth_service.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class SignUpController extends GetxController with BaseController {
  final AuthService _authService = AuthService();

  // controllers
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();

  final _loading = false.obs;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conformPasswordController.dispose();

    super.dispose();
  }

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get conformPasswordController =>
      _conformPasswordController;
  bool get loading => _loading.value;

  bool validate() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    try {
      if (_nameTextController.text == "" ||
          _emailController.text == "" ||
          passwordController.text == "" ||
          _conformPasswordController.text == "") {
        throw InvalidException("please fill all given inputs !!", false);
      } else {
        if (emailValid) {
          if (passwordController.text.length >= 8) {
            if (passwordController.text == conformPasswordController.text) {
              return true;
            } else {
              throw InvalidException("conform your password !!", false);
            }
          } else {
            throw InvalidException("password must be greater than 8 !!", false);
          }
        } else {
          throw InvalidException("Email is not valid !!", false);
        }
      }
    } catch (e) {
      handleError(e);
      return false;
      // rethrow;
    }
  }

// register

  Future<void> register(Function(bool)? success) async {
    final valid = validate();
    if (valid) {
      _loading.value = true;
      await Future.delayed(const Duration(seconds: 2));

// ? register method
      bool status = await _authService.register(
        {
          "email": _emailController.text.toString(),
          "password": _passwordController.text.toString(),
        },
      );
      _loading.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      success!(status);
    }
  }
}
