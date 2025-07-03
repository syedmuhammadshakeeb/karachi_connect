abstract class PostEvent {
  const PostEvent();
}

class CreatePostEvent extends PostEvent {
  final String title;
  final String description;
  final String summery;

  const CreatePostEvent({
    required this.title,
    required this.description,
    required this.summery,
  });
}

class IsPostcreatedEvent extends PostEvent {
  final bool? isPostCreated;

  const IsPostcreatedEvent({this.isPostCreated});
}

class GetPostData extends PostEvent {
  String? id;
  GetPostData({this.id});
}
class PostCommentEvent extends PostEvent {
  String? postid;
  String? senderId;
  String? comment;
  PostCommentEvent({this.comment, this.postid, this.senderId});
}
