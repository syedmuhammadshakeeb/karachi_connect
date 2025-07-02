import 'package:karachi_connect/model/post_model/post_model.dart';

class PostState {
  final bool isLoading;
  final PostModel? postData;
  
  final bool? isPostCreated;
  final List<PostModel>? getPostList;
  final List<PostModel>? userOwnPostList;
  const PostState({this.isLoading = false, this.postData, this.isPostCreated, this.getPostList, this.userOwnPostList});
  PostState copyWith({bool? isLoading, PostModel? postData, bool? isPostCreated, List<PostModel>? userOwnPostData, List<PostModel>? getPostList, List<PostModel>? userOwnPostList}) {
    return PostState(
      postData: postData ?? this.postData,
      isPostCreated: isPostCreated ?? this.isPostCreated,
      isLoading: isLoading ?? this.isLoading,
     
      getPostList: getPostList ?? this.getPostList,
      userOwnPostList: userOwnPostList ?? this.userOwnPostList
    );
  }
}
