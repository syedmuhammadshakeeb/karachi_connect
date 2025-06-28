import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:karachi_connect/model/user_model/user_model.dart';

class AuthState {
  final bool isVisible;
  final bool isSucess;
  final bool isLaoding;
  final UserModel? userData;
  final bool documentUpload;
  String? passwordError;
  final List<File>? files;
  final bool? isauthticated;
  FilePickerResult? result;

  AuthState(
      {this.isVisible = true,
      this.isSucess = false,
      this.files,
      this.passwordError,
      this.isauthticated =false,
      this.isLaoding = false,
      this.result,

      this.userData,
      this.documentUpload = false});
  AuthState copyWith(
          {bool? isVisible,
          bool? isSucess,
          List<File>? files,
          bool? isLaoding,
          FilePickerResult? result,
          String? passwordError,
          UserModel? userData,
          bool? isauthticated,
          bool? documentUpload}) =>
      AuthState(
          isVisible: isVisible ?? this.isVisible,
          isLaoding: isLaoding ?? this.isLaoding,
          isSucess: isSucess ?? this.isSucess,
          documentUpload: documentUpload ?? this.documentUpload,
          files: files ?? this.files,
          passwordError: passwordError ?? this.passwordError,
          isauthticated: isauthticated ?? this.isauthticated,
          userData: userData ?? this.userData,
          result: result ?? this.result);
}
