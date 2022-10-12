// import 'package:flutter/rendering.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/helper/dialog_helper.dart';
import 'package:karmalab_assignment/services/base/base_client.dart';
import 'package:karmalab_assignment/services/shared_pref_service.dart';

class AuthService extends BaseController {
  final SharedPrefService _prefService = SharedPrefService();

  final BaseClient _baseClient = BaseClient();

  Future<bool> register(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.registerAPI,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      _prefService.userLog(
        id: result["id"],
        email: result["email"],
        token: result["token"],
      );
      return true;
    } else {
      return false;
    }
  }

// !! login method
  Future<bool> login(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.loginAPI,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      _prefService.userLog(
        id: result["user"]["id"],
        email: result["user"]["email"],
        token: result["user"]["token"],
      );
      return true;
    } else {
      return false;
    }
  }

  // !! send otp
  Future<bool> sentOtp(dynamic object) async {
    var result = await _baseClient.post(
      NetworkConstants.forgotPassWord,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      debugPrint("otp send");
      _prefService.forgotPassCred(
        token: result["token"],
        otp: int.parse(result["otp"]),
      );
      DialogHelper.showSnackBar(
        description: "${result["otp"]} is your Learn net verification code.",
        duration: const Duration(seconds: 10),
      );

      return true;
    } else {
      return false;
    }
  }

  // !! send otp
  Future<bool> verifyOtp(dynamic object) async {
    // debugPrint(object.toString());
    // debugPrint(await _prefService.getToken());
    var token = await _prefService.getToken();
    var result = await _baseClient.post(
      NetworkConstants.verifyOtp,
      object,
      header: {
        'Content-Type': "application/json",
        'Authorization': "Token $token"
      },
    ).catchError(handleError);

    if (result != null) {
      result = json.decode(result);
      print(result.toString());
      print("======");
      print(result["token"]);

      _prefService.updateToken(result["token"]);
      debugPrint("verify otp");

      return true;
    } else {
      return false;
    }
  }

  // !! send otp
  Future<bool> resetPassword(dynamic object) async {
    debugPrint("new token");
    debugPrint(object.toString());

    debugPrint(await _prefService.getToken());
    var token = await _prefService.getToken();
    var result = await _baseClient.post(
      NetworkConstants.resetPassApi,
      object,
      header: {
        'Content-Type': "application/json",
        'Authorization': "Token $token"
      },
    ).catchError(handleError);
    debugPrint(result.toString());

    if (result != null) {
      result = json.decode(result);
      debugPrint("reset password");
      debugPrint(result.toString());

      return true;
    } else {
      return false;
    }
  }
}
