part of 'restpassword_bloc.dart';

@immutable
abstract class RestpasswordState {}

class RestpasswordInitial extends RestpasswordState {}
class RestpasswordblocLoading extends RestpasswordState{}
class RestpasswordblocLoaded extends RestpasswordState{
  final RestpasswordModel restpasswordModel;
  RestpasswordblocLoaded({required this.restpasswordModel});
}
class RestpasswordblocError extends RestpasswordState{
final String invalidmessage;
RestpasswordblocError({required this.invalidmessage});
}