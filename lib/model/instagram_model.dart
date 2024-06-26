// import 'package:json_annotation/json_annotation.dart';
// part 'instagram_model.g.dart';

// @JsonSerializable()
// class InstagramResponse {
//   String username;
//   String profilePicture;
//   String bio;
//   int followers;
//   int following;
//   int postsCount;
//   List<Post> posts;

//   InstagramResponse({
//     this.username = '',
//     this.profilePicture = '',
//     this.bio = '',
//     this.followers = 0,
//     this.following = 0,
//     this.postsCount = 0,
//     this.posts = const [],
//   });

//   factory InstagramResponse.fromJson(Map<String, dynamic> json) =>
//       _$InstagramResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$InstagramResponseToJson(this);
// }

// @JsonSerializable()
// class Post {
//   String caption;
//   String imageUrl;
//   String dateTime;

//   Post({
//     this.caption = '',
//     this.imageUrl = '',
//     this.dateTime = '',
//   });

//   factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

//   Map<String, dynamic> toJson() => _$PostToJson(this);
// }
