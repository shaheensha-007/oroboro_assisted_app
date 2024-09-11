part of 'restpassword_bloc.dart';

@immutable
abstract class RestpasswordState {}

class RestpasswordInitial extends RestpasswordState {}
class RestpasswordblocLoading extends RestpasswordState{}
class RestpasswordblocLoaded extends RestpasswordState{}
class RestpasswordblocError extends RestpasswordState{}