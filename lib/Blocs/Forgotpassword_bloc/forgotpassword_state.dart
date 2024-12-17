part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordState {}

class ForgotpasswordInitial extends ForgotpasswordState {}
class ForgotpasswordblocLoading extends ForgotpasswordState{}
class ForgotpasswordblocLoaded extends ForgotpasswordState{
  final ForgotpasswordModel forgotpasswordModel;
  ForgotpasswordblocLoaded({required this.forgotpasswordModel});
}
class ForgotpasswordblocError extends ForgotpasswordState{
  final String Errormessage;
  ForgotpasswordblocError({required this.Errormessage});
}
