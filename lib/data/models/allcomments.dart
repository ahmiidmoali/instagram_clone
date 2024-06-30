class AllComments {
  int? commentsId;
  String? commentsContent;
  int? commentsUserid;
  int? commentsPostid;
  String? commentsTime;
  String? usersName;
  String? usersFullname;
  int? usersId;
  String? usersProfilepic;

  AllComments(
      {this.commentsId,
      this.commentsContent,
      this.commentsUserid,
      this.commentsPostid,
      this.commentsTime,
      this.usersName,
      this.usersFullname,
      this.usersId,
      this.usersProfilepic});

  AllComments.fromJson(Map<String, dynamic> json) {
    commentsId = json['comments_id'];
    commentsContent = json['comments_content'];
    commentsUserid = json['comments_userid'];
    commentsPostid = json['comments_postid'];
    commentsTime = json['comments_time'];
    usersName = json['users_name'];
    usersFullname = json['users_fullname'];
    usersId = json['users_id'];
    usersProfilepic = json['users_profilepic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments_id'] = this.commentsId;
    data['comments_content'] = this.commentsContent;
    data['comments_userid'] = this.commentsUserid;
    data['comments_postid'] = this.commentsPostid;
    data['comments_time'] = this.commentsTime;
    data['users_name'] = this.usersName;
    data['users_fullname'] = this.usersFullname;
    data['users_id'] = this.usersId;
    data['users_profilepic'] = this.usersProfilepic;
    return data;
  }
}
