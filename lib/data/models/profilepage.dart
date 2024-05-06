// class ProfilePage {
//   int? followers;
//   int? following;
//   int? posts;
//   List<Allposts>? allposts;

//   ProfilePage({this.followers, this.following, this.posts, this.allposts});

//   ProfilePage.fromJson(Map<String, dynamic> json) {
//     followers = json['followers'];
//     following = json['following'];
//     posts = json['posts'];
//     if (json['allposts'] != null) {
//       allposts = <Allposts>[];
//       json['allposts'].forEach((v) {
//         allposts!.add(new Allposts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['followers'] = this.followers;
//     data['following'] = this.following;
//     data['posts'] = this.posts;
//     if (this.allposts != null) {
//       data['allposts'] = this.allposts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Allposts {
//   int? postsId;
//   String? postsUrl;
//   String? postsDisc;
//   int? postsType;
//   int? postsPrivate;
//   String? postsTime;
//   int? postsUserid;

//   Allposts(
//       {this.postsId,
//       this.postsUrl,
//       this.postsDisc,
//       this.postsType,
//       this.postsPrivate,
//       this.postsTime,
//       this.postsUserid});

//   Allposts.fromJson(Map<String, dynamic> json) {
//     postsId = json['posts_id'];
//     postsUrl = json['posts_url'];
//     postsDisc = json['posts_disc'];
//     postsType = json['posts_type'];
//     postsPrivate = json['posts_private'];
//     postsTime = json['posts_time'];
//     postsUserid = json['posts_userid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['posts_id'] = this.postsId;
//     data['posts_url'] = this.postsUrl;
//     data['posts_disc'] = this.postsDisc;
//     data['posts_type'] = this.postsType;
//     data['posts_private'] = this.postsPrivate;
//     data['posts_time'] = this.postsTime;
//     data['posts_userid'] = this.postsUserid;
//     return data;
//   }
// }
