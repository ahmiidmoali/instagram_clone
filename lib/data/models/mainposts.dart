class MainPosts {
  int? postsId;
  String? postsUrl;
  String? postsDisc;
  int? postsType;
  int? postsPrivate;
  String? postsTime;
  int? postsUserid;
  String? usersName;
  String? usersFullname;
  int? usersId;
  String? usersProfilepic;
  int? followId;
  int? favourites;

  MainPosts(
      {this.postsId,
      this.postsUrl,
      this.postsDisc,
      this.postsType,
      this.postsPrivate,
      this.postsTime,
      this.postsUserid,
      this.usersName,
      this.usersFullname,
      this.usersId,
      this.usersProfilepic,
      this.followId,
      this.favourites});

  MainPosts.fromJson(Map<String, dynamic> json) {
    postsId = json['posts_id'];
    postsUrl = json['posts_url'];
    postsDisc = json['posts_disc'];
    postsType = json['posts_type'];
    postsPrivate = json['posts_private'];
    postsTime = json['posts_time'];
    postsUserid = json['posts_userid'];
    usersName = json['users_name'];
    usersFullname = json['users_fullname'];
    usersId = json['users_id'];
    usersProfilepic = json['users_profilepic'];
    followId = json['follow_id'];
    favourites = json['favourites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posts_id'] = this.postsId;
    data['posts_url'] = this.postsUrl;
    data['posts_disc'] = this.postsDisc;
    data['posts_type'] = this.postsType;
    data['posts_private'] = this.postsPrivate;
    data['posts_time'] = this.postsTime;
    data['posts_userid'] = this.postsUserid;
    data['users_name'] = this.usersName;
    data['users_fullname'] = this.usersFullname;
    data['users_id'] = this.usersId;
    data['users_profilepic'] = this.usersProfilepic;
    data['follow_id'] = this.followId;
    data['favourites'] = this.favourites;
    return data;
  }
}
