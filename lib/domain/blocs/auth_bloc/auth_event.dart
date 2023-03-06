abstract class AuthEvent {}

class CreateAccountWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  CreateAccountWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class GoogleSignInEvent extends AuthEvent {

}

class LoginAuthEvent extends AuthEvent {
  final String email;
  final String password;

  LoginAuthEvent({required this.email, required this.password});

}

class LogoutAuthEvent extends AuthEvent {

}

class CheckAuthStatusEvent extends AuthEvent {

}
