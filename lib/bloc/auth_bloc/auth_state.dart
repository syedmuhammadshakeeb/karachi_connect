import 'dart:io';

import 'package:file_picker/file_picker.dart';

class AuthState {
  final bool isVisible;
  final bool isSucess;
  final bool documentUpload;
  final List<File>? files;
   FilePickerResult? result;

   AuthState(
      {this.isVisible = true,
      this.isSucess = false,
      this.files,
      this.result,
      this.documentUpload = false});
  AuthState copyWith(
          {bool? isVisible,
          bool? isSucess,
          List<File>? files,
          FilePickerResult? result,
          bool? documentUpload}) =>
      AuthState(
          isVisible: isVisible ?? this.isVisible,
          isSucess: isSucess ?? this.isSucess,
          documentUpload: documentUpload ?? this.documentUpload,
          files: files ?? this.files,
          result: result ?? this.result);
}
