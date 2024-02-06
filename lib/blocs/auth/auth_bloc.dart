import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuqood/models/sign_in_fom.dart';
import 'package:nuqood/models/sign_up_form_model.dart';
import 'package:nuqood/models/user_model.dart';
import 'package:nuqood/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            emit(AuthLoading());

            final res = await AuthService().checkEmail(event.email);

            if (res == false) {
              emit(AuthCheckEmailSuccess());
            } else {
              emit(const AuthFailed("Email Already Exist !"));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
        if (event is Authregister) {
          try {
            emit(AuthLoading());

            final user = await AuthService().register(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is Authlogin) {
          try {
            emit(AuthLoading());

            final user = await AuthService().login(event.data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is AuthGetCurrentUser) {
          try {
            emit(AuthLoading());
            
            final SignInFormModel data =
                await AuthService().getCredentialUser();

            final UserModel user = await AuthService().login(data);

            emit(AuthSuccess(user));
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
