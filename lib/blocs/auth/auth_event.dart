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
