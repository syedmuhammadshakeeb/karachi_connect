import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/services/auth_service.dart';
import 'package:karachi_connect/utils/functions/error_handler.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<IsVisiblePassword>(isvisible);
    on<SignupEvent>(signupApi);
    on<UploadDocument>(uploadDocument);
    on<ClearDocument>(clearDocument);
    on<SetDocumentError>(setDocumentError);
    on<PasswordValidator>(passwordValidator);
    on<LoginEvent>(getLogin);
  }
  AuthService authService = AuthService();

  // Signup Api

  Future<void> signupApi(SignupEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLaoding: true));
    try {
      await authService.signUpApi(
        role: event.role ?? 'investor',
        email: event.email?.text,
        password: event.password?.text,
        name: event.name?.text,
        phone: event.phoneNo?.text,
        ntn: event.ntn?.text,
      );
      emit(state.copyWith(
        isSucess: true,
        isLaoding: false,
      ));
    } catch (e) {
      log("SignUpApi Error: $e");
      emit(state.copyWith(isSucess: false, isLaoding: false));
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

    if (result?.files != null && (result?.files.isNotEmpty == true)) {
      emit(state.copyWith(
        files: result?.paths.map((path) => File(path!)).toList(),
      ));
    } else {
      null;
    }

    print("file is ${result?.files.first.size}");
  }

  // Clear File data
  Future<void> clearDocument(
      ClearDocument event, Emitter<AuthState> emit) async {
    print("Clearing selected files...");
    emit(state.copyWith(
      files: null,
      result: null,
    ));
  }

  setDocumentError(SetDocumentError event, Emitter<AuthState> emit) {
    emit(state.copyWith(documentUpload: event.isError));
  }

  // Password Validator
  Future<void> passwordValidator(
      PasswordValidator event, Emitter<AuthState> emit) async {
    String? passwordError = _validatePassword(event.value);
    emit(state.copyWith(
        passwordError:
            passwordError)); // Update the state with the error or null
  }

// Password Validation Logic
  String? _validatePassword(String? value) {
    // Ensure password is not empty
    if (value == null && (value?.isEmpty == true)) {
      return 'Password is required';
    }

    // Define regex for strong password
    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$';

    RegExp regex = RegExp(passwordPattern);

    // If the password doesn't match the pattern, return the error message
    if (!regex.hasMatch(value!)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character';
    } else {
      state.passwordError = null;
      return null;
    } // Password is valid
  }

  // Login Api
  Future getLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLaoding: true));
    try {
      await authService.loginApi(
          email: event.email?.text, password: event.password?.text);
      emit(state.copyWith(isLaoding: false, isSucess: true));
    } catch (e) {
      log("getLogin Error: $e");
      emit(state.copyWith(
        isLaoding: false,
        isSucess: false,
      ));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }
}
