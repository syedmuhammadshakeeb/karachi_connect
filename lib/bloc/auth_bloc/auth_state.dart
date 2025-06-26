import 'dart:io';

import 'package:file_picker/file_picker.dart';

class AuthState {
  final bool isVisible;
  final bool isSucess;
  final List<File>? files;
  final FilePickerResult? result;

  const AuthState({this.isVisible = false, this.isSucess = false, this.files, this.result});
  AuthState copyWith({bool? isVisible, bool? isSucess, List<File>? files, FilePickerResult? result}) =>
      AuthState(
          isVisible: isVisible ?? this.isVisible,
          isSucess: isSucess ?? this.isSucess,
          files: files ?? this.files,
          result: result ?? this.result);
}
