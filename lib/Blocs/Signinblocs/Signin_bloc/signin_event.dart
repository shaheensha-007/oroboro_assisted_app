part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}
class FetchSignin extends SigninEvent{
  final String userName;
  final String password;
  FetchSignin({required this.userName,required this.password});
}
