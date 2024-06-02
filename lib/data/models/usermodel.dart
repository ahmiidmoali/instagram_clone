// class User {
//   int? usersId;
//   String? usersName;
//   String? usersFullname;
//   String? usersEmail;
//   int? usersApprove;
//   String? usersCreate;

//   User(
//       {this.usersId,
//       this.usersName,
//       this.usersFullname,
//       this.usersEmail,
//       this.usersApprove,
//       this.usersCreate});

//   User.fromJson(Map<String, dynamic> json) {
//     usersId = json['users_id'];
//     usersName = json['users_name'];
//     usersFullname = json['users_fullname'];
//     usersEmail = json['users_email'];
//     usersApprove = json['users_approve'];
//     usersCreate = json['users_create'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['users_id'] = this.usersId;
//     data['users_name'] = this.usersName;
//     data['users_fullname'] = this.usersFullname;
//     data['users_email'] = this.usersEmail;
//     data['users_approve'] = this.usersApprove;
//     data['users_create'] = this.usersCreate;
//     return data;
//   }
// }
