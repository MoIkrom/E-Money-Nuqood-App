import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuqood/models/sign_in_fom.dart';
import 'package:nuqood/models/sign_up_form_model.dart';
import 'package:nuqood/models/user_edit_form_model.dart';
import 'package:nuqood/models/user_model.dart';
import 'package:nuqood/services/auth_service.dart';
import 'package:nuqood/services/user_service.dart';
import 'package:nuqood/services/wallet_service.dart';

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
        if (event is AuthUpdateUser) {
          try {
            if (state is AuthSuccess) {
              final updatedUser = (state as AuthSuccess).user.copyWith(
                    name: event.data.name,
                    username: event.data.username,
                    email: event.data.email,
                    password: event.data.password,
                  );
              emit(AuthLoading());
              await UserService().updateUser(event.data);
              emit(AuthSuccess(updatedUser));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is AuthUpdateBalance) {
          if (state is AuthSuccess) {
            final currentUser = (state as AuthSuccess).user;
            final updatedBalanced = currentUser.copyWith(
              balance: currentUser.balance! + event.amount,
            );
            emit(AuthSuccess(updatedBalanced));
          }
        }
        if (event is UpdatePin) {
          try {
            if (state is AuthSuccess) {
              final updatedUser = (state as AuthSuccess).user.copyWith(
                    pin: event.newPin,
                  );
              emit(AuthLoading());
              await WalletService().updatePin(event.oldPin, event.newPin);
              emit(AuthSuccess(updatedUser));
            }
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is AuthLogout) {
          try {
            emit(AuthLoading());

            await AuthService().logout();
            emit(AuthInitial());
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
