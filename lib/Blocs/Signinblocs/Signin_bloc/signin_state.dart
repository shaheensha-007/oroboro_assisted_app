part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninblocLoading extends SigninState{}
class SigninblocLoaded extends SigninState{
  final SignloginModel signloginModel;
  SigninblocLoaded({required this.signloginModel});
}
class SigninblocError extends SigninState{
  final String Errormessage;
  SigninblocError({required this.Errormessage});
}
