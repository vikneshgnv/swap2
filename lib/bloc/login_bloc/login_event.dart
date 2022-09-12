part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}


class LoginUser extends LoginEvent {
  String code;
  String password;

  LoginUser(this.code,this.password);

}