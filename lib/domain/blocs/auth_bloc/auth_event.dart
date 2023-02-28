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
