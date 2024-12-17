part of 'userdetalis_bloc.dart';

@immutable
abstract class UserdetalisState {}

class UserdetalisInitial extends UserdetalisState {}
class UserdetalisblocLoading extends UserdetalisState{}
class UserdetalisblocLoaded extends UserdetalisState{
  final UserdetalisModel userdetalisModel;
  UserdetalisblocLoaded({required this.userdetalisModel});
}
class UserdetalisblocError extends UserdetalisState{
  final String Errormessage;
  UserdetalisblocError({required this.Errormessage});
}
