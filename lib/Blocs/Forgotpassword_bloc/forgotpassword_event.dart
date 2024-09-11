part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordEvent {}
class FetchForgotpassword extends ForgotpasswordEvent{
  final String Username;
  final String Mobilenumber;
  FetchForgotpassword({required this.Username,required this.Mobilenumber});
}
