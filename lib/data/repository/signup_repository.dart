import 'package:instagram_clone/core/functions/uploadfile.dart';
import '../web_services/signup_web_services.dart';

class SignUpRepository {
  final SignUpWebServices signUpWebServices;
  SignUpRepository(this.signUpWebServices);

  Future<RequestResult> trySignUp(
      String username, String fullname, String email, String password) async {
    final result =
        await signUpWebServices.trySignUp(username, fullname, email, password);

    return result;
  }
}
