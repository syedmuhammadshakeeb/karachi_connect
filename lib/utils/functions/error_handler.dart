import 'dart:developer';

import 'package:karachi_connect/component/custom_snakbar/custom_snakbar.dart';
import 'package:karachi_connect/main.dart';
import 'package:karachi_connect/utils/constants/app_strings.dart';


class ErrorHandler {
  static String? getErrorMsgFromException(
    dynamic e, {
    bool isShowToast = false,
    bool isErrorData = false,
  }) {
    try {
      log("e.response==>${e.response}==${e.response.statusCode}");
      if (e.response != null) {
        Map error = e.response?.data;
        int errorStatusCode = e.response.statusCode;
        String? errorMessage =
            error.containsKey("message") &&
                    error["message"].runtimeType == String
                ? error["message"]
                : null;
        String? errorData =
            error.containsKey("data") && error["data"].runtimeType == String
                ? error["data"]
                : null;
        if (errorStatusCode == 404) {
          errorMessage = AppStrings.DATA_NOT_FOUND.replaceAll("_", " ");
          errorData = AppStrings.DATA_NOT_FOUND.replaceAll("_", " ");
        }

        log("show toast=>$isShowToast==$errorMessage");
        if (isShowToast && isErrorData && errorData != null) {
          log("show error data toast=>$isShowToast==$errorData");
          showSnackBar(
            globalContext!,
            "Error: ${errorData.toString().replaceAll("-", r" ")}",
          );
          // customToast(msg: errorData.replaceAll("-", " "), isFailed: true);
        } else if (isShowToast && errorMessage != null) {
          log("show error msg toast=>$isShowToast==$errorMessage");

          showSnackBar(
            navigatorKey.currentContext!,
            "Error: ${errorMessage.toString().replaceAll("-", r" ")}",
          );

          // log("show toast");
          // customToast(msg: errorMessage.replaceAll("-", " "), isFailed: true);
        }
        return errorMessage;
      }
      return null;
    } catch (e) {
      log("error in handler==>${e.toString()}");
      return null;
    }
  }
}
