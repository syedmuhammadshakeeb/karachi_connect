import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/services/auth_service.dart';
import 'package:karachi_connect/services/shared_preference/shared_preference.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
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
    on<IsAuthenticated>(isAuthenticated);
  }
  AuthService authService = AuthService();
  static String? userRole;
  static String? userId;
  static String? userToken;

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
            passwordError)); 
  }

// Password Validation Logic
  String? _validatePassword(String? value) {
   
    if (value == null && (value?.isEmpty == true)) {
      return 'Password is required';
    }

  
    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$';

    RegExp regex = RegExp(passwordPattern);

   
    if (!regex.hasMatch(value!)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character';
    } else {
      state.passwordError = null;
      return null;
    } 
  }

  // Login Api
  Future getLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLaoding: true));
    try {
      final user = await authService.loginApi(
          email: event.email?.text, password: event.password?.text);

      print("user role before ${state.userData}");
      emit(state.copyWith(isLaoding: false, isSucess: true, userData: user));
      print("user role after ${state.userData?.id}");

      userRole = state.userData?.role;
      userId = state.userData?.id;
      userToken = state.userData?.token;
      SharedPreferenceService.setString(userToken ?? '', Enviroment.getToken);
    } catch (e) {
      log("getLogin Error: $e");
      emit(state.copyWith(
        isLaoding: false,
        isSucess: false,
      ));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

  // check user authenticated or not
  Future isAuthenticated(IsAuthenticated event, Emitter<AuthState> emit) async {
    String? token =
        await SharedPreferenceService.getString(Enviroment.getToken);

    if (token == null || token.isEmpty) {
      emit(state.copyWith(isauthticated: false));
      print("User not authenticated");
    } else {
   
      userToken = token;

      emit(state.copyWith(isauthticated: true));
      print("User authenticated");
    }
  }
}
