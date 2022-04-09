// import 'dart:convert';
// import 'dart:ui';

// class Post {
//   int postID;
//   String postBody;
//   Image photo;
//   Post({
//     required this.postID,
//     required this.postBody,
//     required this.photo,
//   });

//   Post copyWith({
//     int? postID,
//     String? postBody,
//     Image? photo,
//   }) {
//     return Post(
//       postID: postID ?? this.postID,
//       postBody: postBody ?? this.postBody,
//       photo: photo ?? this.photo,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'postID': postID,
//       'postBody': postBody,
//       'photo': photo.toMap(),
//     };
//   }

//   factory Post.fromMap(Map<String, dynamic> map) {
//     return Post(
//       postID: map['postID']?.toInt() ?? 0,
//       postBody: map['postBody'] ?? '',
//       photo: Image.fromMap(map['photo']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

//   @override
//   String toString() => 'Post(postID: $postID, postBody: $postBody, photo: $photo)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is Post &&
//       other.postID == postID &&
//       other.postBody == postBody &&
//       other.photo == photo;
//   }

//   @override
//   int get hashCode => postID.hashCode ^ postBody.hashCode ^ photo.hashCode;
// }
