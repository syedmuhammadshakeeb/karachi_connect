import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_event.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/component/custom_snakbar/custom_snakbar.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';
import 'package:karachi_connect/screens/post_screen/component/create_post_appbar.dart';

import 'package:karachi_connect/screens/post_screen/component/create_post_ui.dart';
import 'package:karachi_connect/screens/post_screen/component/dialog/post_sucessful_dialog.dart';
import 'package:karachi_connect/utils/constants/images.dart';

import '../../model/post_model/post_model.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => PostBloc(),
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50), child: CreatePostAppbar()),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bgImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state.isLoading == true) {
                    return const LoadingComponent();
                  }
                  if (state.isPostCreated == true) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      PostSucessfulDialog.showPostSucessfulDialog(context,
                          onCancelTap: () {
                        titleController.clear();
                        summaryController.clear();
                        descriptionController.clear();
                        Navigator.pop(context);
                      });
                    });
                  }

                  return CreatePostUi(
                    titleController: titleController,
                    summaryController: summaryController,
                    descriptionController: descriptionController,
                    titleValidator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter title';
                      } else {
                        return null;
                      }
                    },
                    summaryValidator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter title';
                      } else {
                        return null;
                      }
                    },
                    descriptionValidator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter title';
                      } else {
                        return null;
                      }
                    },
                    onCreatePostTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          context.read<PostBloc>().add(CreatePostEvent(
                                title: titleController.text,
                                summery: summaryController.text,
                                description: descriptionController.text,
                              ));
                          context.read<PostBloc>().add(AddPostLocallyEvent(
                                  postData: PostModel(
                                title: titleController.text,
                                summary: summaryController.text,
                                description: descriptionController.text,
                              )));
                          titleController.clear();
                          summaryController.clear();
                          descriptionController.clear();
                        } catch (e) {
                          showSnackBar(context, "$e", isSuccess: false);
                        }
                      }
                    },
                  );
                },
              )),
        ),
      ),
    );
  }
}
