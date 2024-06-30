import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';
import 'package:instagram_clone/data/repository/signup_repository.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepository signUpRepository;
  SignupCubit(this.signUpRepository) : super(SignupInitial());

  Future<RequestResult> trySignUp(
      String username, String fullname, String email, String password) async {
    emit(SignupLoading());
    var result =
        await signUpRepository.trySignUp(username, fullname, email, password);
    if (result == RequestResult.success) {
      emit(SignupSuccess());
    } else if (result == RequestResult.failure ||
        result == RequestResult.catchfailure) {
      emit(SignupFailure());
    }
    return result;
  }
}
