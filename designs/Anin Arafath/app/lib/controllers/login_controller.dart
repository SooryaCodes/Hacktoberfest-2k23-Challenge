import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/auth_service.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';
import 'package:karmalab_assignment/services/shared_pref_service.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';

class LoginController extends GetxController with BaseController {
  final SharedPrefService _sharedPrefService = SharedPrefService();
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  // controllers
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  final _loading = false.obs;
  // ?? getters
  GlobalKey get formKey => _formKey;
  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool get loading => _loading.value;

// validate login form
  bool validate() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text);

    try {
      if (_nameTextController.text == "" ||
          _emailController.text == "" ||
          passwordController.text == "") {
        throw InvalidException("please fill all given inputs !!", false);
      } else {
        if (emailValid) {
          if (passwordController.text.length >= 8) {
            return true;
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
    }
  }

  Future<void> login(Function(bool)? success) async {
    final valid = validate();
    if (valid) {
      _loading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      // ? login method
      bool status = await _authService.login(
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

  // ignore: logout method
  void logout() {
    _sharedPrefService.clear();
    Get.offNamedUntil(
      SelectAuthView.routeName,
      (_) => false,
    );
    // Get.offAndToNamed(SelectAuthView.routeName);
  }
}
