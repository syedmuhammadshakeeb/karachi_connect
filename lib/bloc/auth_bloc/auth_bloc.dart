import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/services/auth_service.dart';
import 'package:karachi_connect/utils/functions/error_handler.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<IsVisiblePassword>(isvisible);
    on<SignupEvent>(signupApi);
    on<UploadDocument>(uploadDocument);
  }
  AuthService authService = AuthService();

  // Signup Api

  Future<void> signupApi(SignupEvent event, Emitter<AuthState> emit) async {
    try {
      await authService.signUpApi(
        role: event.role ?? 'investor',
        email: event.email?.text,
        password: event.password?.text,
        name: event.name?.text,
        phone: event.phoneNo?.text,
        ntn: event.ntn?.text,
      );
      emit(state.copyWith(isSucess: true));
    } catch (e) {
      log("SignUpApi Error: $e");
      emit(state.copyWith(isSucess: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

// password show and hide
  isvisible(IsVisiblePassword event, Emitter<AuthState> emit) {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  // upload document
  Future<void> uploadDocument(
      UploadDocument event, Emitter<AuthState> emit) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    emit(state.copyWith(result: result));
    if (result != null) {
      emit(state.copyWith(
          files: result.paths.map((path) => File(path!)).toList()));
    } else {
      null;
    }

    print("file is ${result?.files.first.size}");
  }

  // Clear File data
 
  // Login Api
}
