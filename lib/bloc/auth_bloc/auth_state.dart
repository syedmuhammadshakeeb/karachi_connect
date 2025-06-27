import 'dart:io';

import 'package:file_picker/file_picker.dart';

class AuthState {
  final bool isVisible;
  final bool isSucess;
  final bool isLaoding;
  
  final bool documentUpload;
   String? passwordError;
  final List<File>? files;
   FilePickerResult? result;

   AuthState(
      {this.isVisible = true,
      this.isSucess = false,
      this.files,
      this.passwordError,
      this.isLaoding = false,
      this.result,
      this.documentUpload = false});
  AuthState copyWith(
          {bool? isVisible,
          bool? isSucess,
          List<File>? files,
          bool? isLaoding,
          FilePickerResult? result,
          String? passwordError,
          bool? documentUpload}) =>
      AuthState(
          isVisible: isVisible ?? this.isVisible,
          isLaoding: isLaoding ?? this.isLaoding,
          isSucess: isSucess ?? this.isSucess,
          documentUpload: documentUpload ?? this.documentUpload,
          files: files ?? this.files,
          passwordError: passwordError ?? this.passwordError,
          result: result ?? this.result);
}
