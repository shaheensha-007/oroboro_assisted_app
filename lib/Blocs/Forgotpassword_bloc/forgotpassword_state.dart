part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordState {}

class ForgotpasswordInitial extends ForgotpasswordState {}
class ForgotpasswordblocLoading extends ForgotpasswordState{}
class ForgotpasswordblocLoaded extends ForgotpasswordState{}
class ForgotpasswordblocError extends ForgotpasswordState{}
