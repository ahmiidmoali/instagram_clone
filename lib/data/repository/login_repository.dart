import 'package:instagram_clone/data/models/allusers.dart';
import 'package:instagram_clone/data/web_services/login_web_services.dart';

class LoginRepository {
  final LoginWebServices loginWebServices;

  LoginRepository(this.loginWebServices);

  Future<List<AllUsers>> tryLogin(
      String logintype, String email, String password) async {
    final user = await loginWebServices.tryLogin(logintype, email, password);
    return user.map((user) => AllUsers.fromJson(user)).toList();
  }
}
