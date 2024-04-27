class MainPosts {
  int? postsId;
  String? postsUrl;
  String? postsDisc;
  int? postsType;
  int? postsPrivate;
  String? postsTime;
  int? postsUserid;
  int? usersId;
  String? usersName;
  String? usersFullname;
  String? usersEmail;
  String? usersPassword;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  int? followId;

  MainPosts(
      {this.postsId,
      this.postsUrl,
      this.postsDisc,
      this.postsType,
      this.postsPrivate,
      this.postsTime,
      this.postsUserid,
      this.usersId,
      this.usersName,
      this.usersFullname,
      this.usersEmail,
      this.usersPassword,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate,
      this.followId});

  MainPosts.fromJson(Map<String, dynamic> json) {
    postsId = json['posts_id'];
    postsUrl = json['posts_url'];
    postsDisc = json['posts_disc'];
    postsType = json['posts_type'];
    postsPrivate = json['posts_private'];
    postsTime = json['posts_time'];
    postsUserid = json['posts_userid'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersFullname = json['users_fullname'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    followId = json['follow_id'];
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
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_fullname'] = this.usersFullname;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_verifycode'] = this.usersVerifycode;
    data['users_approve'] = this.usersApprove;
    data['users_create'] = this.usersCreate;
    data['follow_id'] = this.followId;
    return data;
  }
}
