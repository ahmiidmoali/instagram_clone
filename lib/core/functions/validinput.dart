import 'package:get/get.dart';

enum Validtype { username, mobile, email, somthingelse }

validInput(String val, int min, int max, Validtype type) {
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == Validtype.username) {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username";
    }
  }
  if (type == Validtype.mobile) {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not vaild phonenumber";
    }
  }

  if (type == Validtype.email) {
    if (!GetUtils.isEmail(val)) {
      return "not vaild email";
    }
  }

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be larger than $max";
  }
}
