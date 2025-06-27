import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';

import 'package:karachi_connect/component/custom_button/custom_button.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/document_upload_screen/component/upload_document_ui.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class DocumentUploadScreen extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? role;
  const DocumentUploadScreen(
      {super.key,
      this.emailController,
      this.nameController,
      this.passwordController,
      this.phoneController,
      this.role});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  TextEditingController ntnController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        lazy: false,
        create: (context) => AuthBloc(),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return CustomButton(
                color: AppColors.darkblue,
                verticalPadding: 20,
                horizontalPadding: 30,
                onTap: () {
                  final bloc = context.read<AuthBloc>();

                  if (bloc.state.result == null ||
                      bloc.state.result?.files.isEmpty == true) {
                    bloc.add(SetDocumentError(true)); // we’ll add this event
                    return;
                  } else {
                    bloc.add(SetDocumentError(false)); // remove error
                  }

                  if (_formKey.currentState?.validate() == true) {
                    bloc.add(SignupEvent(
                      email: widget.emailController,
                      password: widget.passwordController,
                      name: widget.nameController,
                      phoneNo: widget.phoneController,
                      ntn: ntnController,
                      role: widget.role,
                    ));
                  }
                },
                text: 'Upload Document',
                textStyle: AppTextStyles.white16w500,
              );
            },
          ),
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.isSucess == true &&
                  (state.result != null &&
                      state.result?.files.isNotEmpty == true)) {
                Navigator.pushNamed(context, RouteName.accountSucessfullScreen);
              } else {}
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return UploadDocumentUi(
                    ntnController: ntnController,
                    documentUpload: state.documentUpload,
                    onDocumentCanceltap: () {
                      context.read<AuthBloc>().add(ClearDocument());
                      state.result = null;
                    },
                    fileMb: (state.result != null &&
                            state.result?.files.isNotEmpty == true)
                        ? ((state.result?.files.first.size ?? 0) / 100000)
                            .toStringAsFixed(1)
                        : null,
                    filesName: (state.result != null &&
                            state.result?.files.isNotEmpty == true)
                        ? state.result?.files.first.name ?? ''
                        : null,
                    ntnValidator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'NTN is required';
                      } else {
                        return null;
                      }
                    },
                    onDocumentTap: () {
                      context.read<AuthBloc>().add(UploadDocument());
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DocumentUploadScreenArgument {
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? role;
  DocumentUploadScreenArgument(
      {this.emailController,
      this.nameController,
      this.passwordController,
      this.phoneController,
      this.role});
}
