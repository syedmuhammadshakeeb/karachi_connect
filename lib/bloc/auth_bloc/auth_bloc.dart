import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
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
    on<ProfileImagePicker>(pickImage);
    on<GetUserDataEvent>(getUserData);
  }
  AuthService authService = AuthService();
  static String? userRole;
  static String? userId;
  static String? userToken;
  static String? userName;
  static String? userEmail;
  static String? userProfile;

  // Signup Api

  Future<void> signupApi(SignupEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLaoding: true));
    try {
      await authService.signUpApi(
        profileImage: event.profileImage,
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
    emit(state.copyWith(passwordError: passwordError));
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

      SharedPreferenceService.setString(
          state.userData?.token ?? '', Enviroment.getToken);
      SharedPreferenceService.setString(
          state.userData?.role ?? '', Enviroment.getRole);
      SharedPreferenceService.setString(
          state.userData?.id ?? '', Enviroment.getid);
      SharedPreferenceService.setString(
          state.userData?.name ?? '', Enviroment.getName);
      SharedPreferenceService.setString(
          state.userData?.email ?? '', Enviroment.getEmail);
      SharedPreferenceService.setString(
          state.userData?.profileImage ?? '', Enviroment.getProfile);
      userToken = user?.token;
      userRole = user?.role;
      userId = user?.id;
      userName = user?.name;
      userEmail = user?.email;
      userProfile = user?.profileImage;
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
    String? id = await SharedPreferenceService.getString(Enviroment.getid);
    String? role = await SharedPreferenceService.getString(Enviroment.getRole);
    String? name = await SharedPreferenceService.getString(Enviroment.getName);
    String? email =
        await SharedPreferenceService.getString(Enviroment.getEmail);
    String? profile =
        await SharedPreferenceService.getString(Enviroment.getProfile);

    if (token == null || token.isEmpty) {
      emit(state.copyWith(isauthticated: false));
      print("User not authenticated");
    } else {
      userToken = token;
      userEmail = email;
      userName = name;
      userProfile = profile;

      userId = id;
      userRole = role;

      emit(state.copyWith(isauthticated: true));
      print("User authenticated ${userToken} ${userId} ${userRole}");
    }
  }

//  profile image picker

  Future<void> pickImage(
      ProfileImagePicker event, Emitter<AuthState> emit) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    print("image path ${image}");
    if (image != null) {
      emit(state.copyWith(imagepath: File(image.path)));
    }
  }

  // get user Data
  Future getUserData(GetUserDataEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLaoding: true));
    try {
      final userData = await authService.getuserApi(id: event.id);
      emit(state.copyWith(userData: userData, isLaoding: false));
    } catch (e) {
      log("getLogin Error: $e");
      emit(state.copyWith(
        isLaoding: false,
      ));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }
}
