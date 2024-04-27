import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/usermodel.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  List<User> user = [];
  LoginCubit(this.loginRepository) : super(LoginInitial());
  Future<List<User>> tryLogin (
      String logintype, String email, String password) async {
    emit(LoginLoading());
    await loginRepository.tryLogin(logintype, email, password).then((user) {
      if (user.isNotEmpty) {
        emit(LoginLoaded(user));
        this.user = user;

       
      }
      if (user.isEmpty) {
        emit(LoginFailed());
        user = [];
        
      }
      
    });
     return user;
  }
  
}
