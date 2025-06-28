import 'package:karachi_connect/model/post_model/post_model.dart';

class PostState {
  final bool isLoading;
  final PostModel? postData;
  final bool? isPostCreated;
  const PostState({this.isLoading = false, this.postData, this.isPostCreated});
  PostState copyWith({bool? isLoading, PostModel? postData, bool? isPostCreated}) {
    return PostState(
      postData: postData ?? this.postData,
      isPostCreated: isPostCreated ?? this.isPostCreated,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
