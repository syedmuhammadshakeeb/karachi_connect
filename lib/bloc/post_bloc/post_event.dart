import 'package:karachi_connect/model/post_model/post_model.dart';

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
class AddPostLocallyEvent extends PostEvent {
 final PostModel? postData;

  const AddPostLocallyEvent({ this.postData,}); 

  
}
