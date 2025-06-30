import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_event.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/services/post_service.dart';
import 'package:karachi_connect/services/shared_preference/shared_preference.dart';
import 'package:karachi_connect/utils/functions/error_handler.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<CreatePostEvent>(createPost);
    on<IsPostcreatedEvent>(isPostCreated);
    on<AddPostLocallyEvent>(addPostLocally);
  }

  PostService postService = PostService();
  // create post
  Future<void> createPost(
      CreatePostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final postResponse = await postService.createPost(
        title: event.title,
        description: event.description,
        summery: event.summery,
      );

      emit(state.copyWith(isLoading: false, postData: postResponse));
      if (postResponse != null) {
        emit(state.copyWith(isPostCreated: true));
        log("Post Created Successfully: ${postResponse.title}");
      } else {
        emit(state.copyWith(isPostCreated: false));
        log("Post Creation Failed");
      }
    } catch (e) {
      log("Create Post Error: $e");
      
      emit(state.copyWith(isLoading: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

  // isPostCreated

  Future<void> isPostCreated(
      IsPostcreatedEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(isPostCreated: event.isPostCreated));
  }

// add post locally
  Future<void> addPostLocally(
      AddPostLocallyEvent event, Emitter<PostState> emit) async {
    try {
      final localData = state.postDataLocally ?? [];
      localData.add(event.postData!);
      emit(state.copyWith(postDataLocally: localData));
      await SharedPreferenceService.savePostListLocally(state.postDataLocally!);
      log("Post added locally: ${event.postData!.title}");
    } catch (e) {
      log("Error adding post locally: $e");
    }
  }
}
