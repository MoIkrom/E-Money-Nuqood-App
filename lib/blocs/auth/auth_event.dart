part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class Authregister extends AuthEvent {
  final SignUpFormModel data;

  const Authregister(this.data);

  @override
  List<Object> get props => [data];
}

class Authlogin extends AuthEvent {
  final SignInFormModel data;

  const Authlogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserEditFormModel data;

  const AuthUpdateUser(this.data);

  @override
  List<Object> get props => [data];
}
class AuthUpdateBalance extends AuthEvent {
  final int amount;

  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}

class UpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;

  const UpdatePin(
    this.oldPin,
    this.newPin,
  );

  @override
  List<Object> get props => [oldPin, newPin];
}

class AuthLogout extends AuthEvent {}