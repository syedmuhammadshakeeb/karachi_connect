import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_event.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/model/post_model/post_model.dart';
import 'package:karachi_connect/services/post_service.dart';
import 'package:karachi_connect/utils/functions/error_handler.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<CreatePostEvent>(createPost);
    on<IsPostcreatedEvent>(isPostCreated);
    on<GetPostData>(getPostData);
    on<PostCommentEvent>(sendComment);
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

  Future getPostData(GetPostData event, Emitter<PostState> emit) async {
    if (state.getPostList != null) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(isLoading: true));
    }
    try {
      final postList = await postService.getPostApi();
      emit(state.copyWith(getPostList: postList));
      if (state.getPostList != null) {
        List<PostModel> ownPostList = state.getPostList!
            .where((post) => post.createdBy == event.id)
            .toList();

        emit(state.copyWith(userOwnPostList: ownPostList, isLoading: false));
      }
      print(postList?.first.id);
    } catch (e) {
      log("Get Post Error: $e");

      emit(state.copyWith(isLoading: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }

  Future sendComment(PostCommentEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await postService.postCommentApi(
          postId: event.postid,
          comment: event.comment,
          senderId: event.senderId);
    } catch (e) {
      log("Post comment Error: $e");

      emit(state.copyWith(isLoading: false));
      ErrorHandler.getErrorMsgFromException(e, isShowToast: true);
    }
  }
}
