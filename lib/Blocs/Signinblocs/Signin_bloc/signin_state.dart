part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninblocLoading extends SigninState{}
class SigninblocLoaded extends SigninState{}
class SigninblocError extends SigninState{}
