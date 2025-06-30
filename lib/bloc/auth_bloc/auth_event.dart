import 'package:flutter/widgets.dart';

abstract class AuthEvent {
  AuthEvent();
}

class SignupEvent extends AuthEvent {
  final TextEditingController? email;
  final TextEditingController? password;
  final TextEditingController? phoneNo;
  final TextEditingController? name;
  final TextEditingController? ntn;
  final String? role;
  SignupEvent(
      {this.email,
      this.password,
      this.phoneNo,
      this.name,
      this.ntn,
      this.role});
}

class LoginEvent extends AuthEvent {
  final TextEditingController? email;
  final TextEditingController? password;

  LoginEvent({this.email, this.password});
}

class IsVisiblePassword extends AuthEvent {}

class UploadDocument extends AuthEvent {}

class ClearDocument extends AuthEvent {}
class IsAuthenticated extends AuthEvent {}
class ProfileImagePicker extends AuthEvent {}

class SetDocumentError extends AuthEvent {
  final bool isError;

  SetDocumentError(this.isError);
}

class PasswordValidator extends AuthEvent {
  final String? value;

  PasswordValidator(this.value);
}
