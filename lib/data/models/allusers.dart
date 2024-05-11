class AllUsers {
  int? usersId;
  String? usersName;
  String? usersFullname;
  String? usersEmail;
  String? usersCreate;
  int? usersPrivate;
  String? usersProfilepic;

  AllUsers(
      {this.usersId,
      this.usersName,
      this.usersFullname,
      this.usersEmail,
      this.usersCreate,
      this.usersPrivate,
      this.usersProfilepic});

  AllUsers.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersFullname = json['users_fullname'];
    usersEmail = json['users_email'];
    usersCreate = json['users_create'];
    usersPrivate = json['users_private'];
    usersProfilepic = json['users_profilepic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_fullname'] = this.usersFullname;
    data['users_email'] = this.usersEmail;
    data['users_create'] = this.usersCreate;
    data['users_private'] = this.usersPrivate;
    data['users_profilepic'] = this.usersProfilepic;
    return data;
  }
}
